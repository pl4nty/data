<#
.SYNOPSIS
    Analyzes a Lenovo System Update Addin log file and displays a human-readable summary.

.DESCRIPTION
    Invoke-LCVLogViewer parses a LenovoSystemUpdateAddin log file and extracts key diagnostic
    information: session details, system info, update schedule, scan results, install results,
    and errors/warnings. Output is written to the console and optionally to a plain-text file.

.PARAMETER LogFile
    Path to the Lenovo System Update Addin log file to analyze. The file is expected to
    follow the naming pattern LenovoSystemUpdateAddin_YYYYMMDD-HHmmss-NNN.log.

.PARAMETER OutputFile
    Optional path to write a plain-text summary report. If the file already exists the
    script prompts for confirmation before overwriting unless -Force is also specified.

.PARAMETER Sections
    Limit output to one or more specific report sections. Valid values:
      All, SessionInfo, SystemInfo, UpdateSchedule, ScanResults, InstallResults, Errors, Warnings
    Use 'All' to explicitly request every section. If omitted, all sections are displayed.

.PARAMETER Force
    Overwrite the OutputFile without prompting if it already exists.

.PARAMETER IncludeBenign
    Include known-benign warnings and errors (e.g. assembly load warnings, duplicate
    database insert attempts) in the Errors & Warnings output. By default these are
    suppressed and only a total count is shown.

.EXAMPLE
    .\Invoke-LCVLogViewer -LogFile "C:\logs\LenovoSystemUpdateAddin_20260220-121706-015.log"

    Displays all sections in the console.

.EXAMPLE
    .\Invoke-LCVLogViewer -LogFile ".\session.log" -OutputFile ".\summary.txt"

    Displays all sections in the console and writes the summary to summary.txt.

.EXAMPLE
    .\Invoke-LCVLogViewer.ps1 -LogFile ".\session.log" -Sections SystemInfo,InstallResults

    Displays only the System Info and Install Results sections.

.EXAMPLE
    .\Invoke-LCVLogViewer.ps1 -LogFile ".\session.log" -OutputFile ".\summary.txt" -Force -IncludeBenign

    Overwrites any existing summary.txt and includes all benign log entries in the output.
#>
function Invoke-LnvCVLogViewer {
[CmdletBinding()]
param(
    [Parameter(Mandatory, Position = 0)]
    [string]$LogFile,

    [Parameter()]
    [string]$OutputFile,

    [Parameter()]
    [ValidateSet('All','SessionInfo','SystemInfo','UpdateSchedule','ScanResults','InstallResults','Errors','Warnings')]
    [string[]]$Sections,

    [Parameter()]
    [switch]$Force,

    [Parameter()]
    [switch]$IncludeBenign
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# ============================================================
#  Constants
# ============================================================
$SCRIPT_VERSION = '1.0'
$SCRIPT_NAME    = 'Invoke-LCVLogViewer.ps1'
$ALL_SECTIONS   = @('SessionInfo','SystemInfo','UpdateSchedule','ScanResults','InstallResults','Errors','Warnings')

# ============================================================
#  Regex patterns (all defined here for maintainability)
# ============================================================
$RE = @{
    # Structured log line: timestamp, level, source, message
    LogLine      = '^(?<ts>\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d{3}):\[tid:\d+\] (?<level>Trace|Debug|Info|Warn|Error) \[(?<source>[^\]]+)\]: (?<msg>.+)$'

    # Addin version embedded in the DLL path on the Program.Start commandline
    AddinVersion = 'LenovoSystemUpdateAddin\\(?<ver>\d+\.\d+\.\d+\.\d+)\\'

    # System info — from HelloProcess log entries
    MTM          = 'MTM received from eGather:\s*(?<mtm>\S+)'
    QOS          = 'QOS \(Quest OS\):\s*(?<os>.+)'
    QOSLang      = 'QOSLang \(Quest language\):\s*(?<lang>\S+)'
    LCID         = 'the LCID is:\s*(?<lcid>[0-9A-Fa-f]+)'
    BIOS         = 'Bios:\s*(?<bios>\S+\s*\([\d.]+\s*\))'

    # Catalog / package repository info
    CatalogURL   = 'Catalog file server path\s*=\s*(?<url>https?://[^\s,;]+)'
    CatalogCount = 'Package count:\s*(?<count>\d+)'

    # Scan phase transitions (JSON logged on a single line)
    ScanPhase    = 'KeyProcessInfo:\s*(?<json>\{.+\})\s*$'

    # Group Policy auto-update control (inside JSON payload)
    GPPolicy     = '"isAutoUpdateControlByGP"\s*:\s*"(?<gp>[^"]+)"'

    # Install command detection
    InstallCmd   = 'Do-DownloadAndInstallUpdates'
    InstallList  = '(?<type>DownloadOnly|InstallOnly|DownloadAndInstall) update list:'
    InstallLen   = '^length:\s*(?<len>\d+)'

    # Per-package install metrics (single log line).
    # installTime may use a comma as decimal separator (European/Asian locales).
    SendMetrics  = 'SendInstallMetrics packaged\s*=\s*(?<id>\S+),\s*install status\s*=\s*(?<status>\S+),installResult=(?<result>\S+)\s+installTime\s*=\s*(?<time>[\d]+(?:[.,][\d]+)?)'

    # Update list headers — matched against $source (not $msg)
    AfterSortSrc = '^SystemUpdateAgent\.GetUpdateHistory$'
    AfterSortMsg = 'After sort update list:'
    CandidateSrc = '^LoadCoreqsProcessor\.ProcessUpdatesImplementation$'
    CandidateMsg = 'Candidate list:'

    # Individual update entry line within a list block
    UpdateEntry  = '^(?<desc>.+)\[reboot type (?<rbt>\d)\]\s*$'

    # Payload line inside a multi-line HandleRequest / HandleResponse JSON block
    PayloadLine  = '"payload":\s*"(?<json>\{.+\})"'

    # Session termination event
    Terminating  = 'AddinHost\.Terminating'
}

# Benign error/warning patterns suppressed by default.
# Each pattern is matched against "$source: $msg" (source without brackets).
$BENIGN_PATTERNS = @(
    # Startup DLL scan — non-assembly DLLs are expected to fail loading
    'Could not load file or assembly .(?:kehelper|proxy|Tools|tvsutil|XmlWriter)\.dll.',
    # Database duplicate-insert suppression — normal when history already exists
    # Covers both new-format (UpdateDatabase.Insert) and old-format (UpdateHistoryRecorder.Insert)
    '(?:UpdateDatabase|UpdateHistoryRecorder)\.Insert.*constraint failed',
    # HttpsDownload Init — misleadingly logged as an error; just logs the HTTP method
    'HttpsDownload\.Init.*Init method:',
    # CoreqProcessor — misleadingly labeled; this is just an informational start message
    'CoreqProcessor\.ProcessUpdatesImplementation.*Beginning Coreq process',
    # DataBase.Load* — misleadingly labeled; successfully loads cached package data.
    # Covers new-format (LoadUpdateData) and old-format (LoadSerializedDataBase).
    'DataBase\.Load\w+.*Loading the Update:',
    # SuSdk framework version — informational, not an error
    'SuSdk\.StartApplication.*Application runs with the framework:',
    # Metrics telemetry disabled — expected when metrics opt-out is configured
    'metric warning.*Deny.*Metric collection is disabled'
)

# Numeric reboot type to human-readable label
$REBOOT_MAP = @{
    '0' = 'None'
    '1' = 'Forced'
    '3' = 'Requested'
    '5' = 'Delayed'
}

# ============================================================
#  Output helpers
# ============================================================
# Lines collected for -OutputFile (plain text, no ANSI codes)
$script:CaptureLines  = [System.Collections.Generic.List[string]]::new()
$script:DoCapture     = $false

# Write a complete line to console (with color) and optionally capture it for the file.
function Write-Out {
    param(
        [string]$Text  = '',
        [string]$Color = 'White'
    )
    Write-Host $Text -ForegroundColor $Color
    if ($script:DoCapture) { $script:CaptureLines.Add($Text) }
}

# Write a label:value field. Label in White, value in $Color.
function Write-Field {
    param(
        [string]$Label,
        [string]$Value,
        [string]$Color = 'Yellow',
        [int]$Width    = 22
    )
    $lbl  = '  {0} : ' -f $Label.PadRight($Width)
    Write-Host $lbl   -NoNewline -ForegroundColor White
    Write-Host $Value -ForegroundColor $Color
    if ($script:DoCapture) { $script:CaptureLines.Add($lbl + $Value) }
}

# Write a table separator / header line.
function Write-TableLine {
    param([string]$Text, [string]$Color = 'White')
    Write-Out $Text $Color
}

# Write one install result row: package ID in White, result colored, rest in White.
function Write-InstallRow {
    param(
        [string]$PkgId,
        [string]$Result,
        [string]$ResultColor,
        [string]$TimeSec,
        [string]$InstallDate
    )
    $p1 = '  {0,-14}'    -f $PkgId
    $p2 = '[{0,-7}]'     -f $Result
    $p3 = ' {0,-10} {1}' -f $TimeSec, $InstallDate

    Write-Host $p1 -NoNewline -ForegroundColor White
    Write-Host $p2 -NoNewline -ForegroundColor $ResultColor
    Write-Host $p3             -ForegroundColor White
    if ($script:DoCapture) { $script:CaptureLines.Add($p1 + $p2 + $p3) }
}

function Write-SectionHeader {
    param([string]$Title)
    Write-Out ''
    Write-Out "--- $Title ---" Cyan
}

function Write-ReportHeader {
    param([string]$Title)
    $sep = '=' * 62
    Write-Out $sep Cyan
    Write-Out "  $Title" Cyan
    Write-Out $sep Cyan
}

# ============================================================
#  Utility helpers
# ============================================================
function Format-Bytes {
    param([long]$Bytes)
    if ($Bytes -ge 1GB) { return '{0:N1} GB' -f ($Bytes / 1GB) }
    if ($Bytes -ge 1MB) { return '{0:N1} MB' -f ($Bytes / 1MB) }
    if ($Bytes -ge 1KB) { return '{0:N1} KB' -f ($Bytes / 1KB) }
    return "$Bytes B"
}

function Format-Span {
    param([TimeSpan]$Span)
    if ($Span.TotalHours   -ge 1) { return '{0}h {1}m {2}s' -f [int]$Span.TotalHours, $Span.Minutes, $Span.Seconds }
    if ($Span.TotalMinutes -ge 1) { return '{0} min {1} sec' -f [int]$Span.TotalMinutes, $Span.Seconds }
    return '{0} sec' -f [int]$Span.TotalSeconds
}

function Get-RebootLabel {
    param([string]$Code)
    if ($REBOOT_MAP.ContainsKey($Code)) { return $REBOOT_MAP[$Code] }
    return "Type $Code"
}

function Test-Benign {
    param([string]$Source, [string]$Msg)
    $combined = "${Source}: ${Msg}"
    foreach ($pat in $BENIGN_PATTERNS) {
        if ($combined -match $pat) { return $true }
    }
    return $false
}

# Returns $true if $Section should be included in the current run.
function Test-SectionEnabled {
    param([string]$Section)
    if ($null -eq $Sections -or $Sections.Count -eq 0) { return $true }
    return $Sections -contains $Section
}

# Safe string coalesce: returns $Value if non-empty, else $Default.
function Coalesce {
    param([string]$Value, [string]$Default = '(not found)')
    if ([string]::IsNullOrWhiteSpace($Value)) { return $Default }
    return $Value
}

# ============================================================
#  Old-format log parser  (tvsu_*.log  —  build 1.0.29.x and earlier)
#
#  Old format uses multi-line log entries:
#    Info    2026-01-26 , 10:40:14.705
#    [TAB] ⬛  Fully.Qualified.ClassName.Method()   (Info entries)
#    [TAB] at Fully.Qualified.ClassName.Method()    (Warning/Severe entries)
#    [TAB] Message: <text>
#    <continuation lines — either tab-indented or space-indented>
#    <blank line — entry separator>
# ============================================================
function Invoke-ParseOldLog {
    param([string]$Path, [string]$HeaderLine)

    $data = [ordered]@{
        FileName          = [System.IO.Path]::GetFileName($Path)
        SessionStart      = ''
        SessionEnd        = ''
        SessionComplete   = $false
        AddinVersion      = ''
        MTM               = ''
        OS                = ''
        Language          = ''
        LCID              = ''
        BIOSVersion       = ''
        CatalogURL        = ''
        CatalogCount      = -1
        GPAutoUpdate      = ''
        Schedule          = [ordered]@{}
        ScanStart         = ''
        ScanEnd           = ''
        ScanStatusCode    = -1
        ApplicableUpdates = [System.Collections.Generic.List[hashtable]]::new()
        InstallRequested  = $false
        DLOnly            = 0
        InstallOnly       = 0
        DLAndInstall      = 0
        RebootNeeded      = $null
        InstallResults    = [System.Collections.Generic.List[hashtable]]::new()
        Issues            = [System.Collections.Generic.List[hashtable]]::new()
        BenignCount       = 0
    }

    # ---- Parse the header line ----
    # Format: [Lenovo System Update Addin build:  1.0.29.4]TAB26/01/2026 10:40:14
    if ($HeaderLine -match '^\[Lenovo System Update Addin build:\s*(?<ver>[\d.]+)\]\t(?<d>\d{2})/(?<m>\d{2})/(?<y>\d{4})\s+(?<time>\d{2}:\d{2}:\d{2})') {
        $data.AddinVersion = $Matches['ver']
        $data.SessionStart = '{0}-{1}-{2} {3}' -f $Matches['y'], $Matches['m'], $Matches['d'], $Matches['time']
    }

    # ---- State machine variables ----
    $entryLevel  = ''
    $entryTs     = ''
    $entrySource = ''
    $msgLines    = [System.Collections.Generic.List[string]]::new()
    $inMsg       = $false

    # Track seen package descriptions to avoid duplicates from repeated GetUpdateRecord calls.
    $seenPackages = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)

    # Process-entry logic as a scriptblock dot-sourced into the caller's scope.
    # Dot-sourcing (. $processEntry) gives it direct read/write access to all
    # local variables in Invoke-ParseOldLog without any $script: prefix.
    $processEntry = {
        if ($entryTs -eq '' -or -not $inMsg) { return }

        $msg = ($msgLines | Where-Object { $_ -ne '' }) -join "`n"
        $msgLines.Clear()
        $inMsg = $false

        # Update session end to the latest timestamp seen.
        if ($data.SessionEnd -eq '' -or $entryTs -gt $data.SessionEnd) {
            $data.SessionEnd = $entryTs
        }

        # Language
        if ($data.Language -eq '' -and $msg -match 'The active language is:\s*(?<lang>\S+)') {
            $data.Language = $Matches['lang']
        }

        # Scan/install phase markers
        if ($msg -match 'Start detect install') {
            if ($data.ScanStart -eq '') { $data.ScanStart = $entryTs }
            $data.InstallRequested = $true
        }
        if ($msg -match 'Running egather complete end') {
            $data.ScanEnd        = $entryTs
            $data.ScanStatusCode = 0
        }

        # SendInstallMetrics
        if ($msg -match 'SendInstallMetrics packaged\s*=\s*(?<id>\S+),\s*install status\s*=\s*(?<status>\S+),installResult=(?<result>\S+)\s+installTime\s*=\s*(?<time>[\d]+(?:[.,][\d]+)?)') {
            # Normalise locale-specific comma decimal separator, then cast to double.
            $timeRaw = ($Matches['time']) -replace ',', '.'
            $timeValDbl = $null
            try { $timeValDbl = [double]$timeRaw } catch { $timeValDbl = $null }
            $data.InstallResults.Add([hashtable]@{
                PackageID    = $Matches['id']
                Status       = $Matches['status']
                Result       = $Matches['result']
                InstallTime  = $timeValDbl
                ActionResult = $Matches['result']
                InstallDate  = ''
            })
            $data.DLAndInstall++
            $data.InstallRequested = $true
        }

        # Update history items: multi-line block following "Message: Update history item:"
        if ($msg -match 'Update history item:') {
            [string[]]$hLines = @(($msg -split "`n") |
                ForEach-Object { $_.Trim() } |
                Where-Object   { $_ -ne '' -and $_ -ne 'Update history item:' })
            if ($hLines.Count -ge 3) {
                $pkgId   = $hLines[0]
                $pkgDesc = $hLines[1]
                $pkgStat = $hLines[2]
                if ($pkgStat -ne 'Canceled' -and -not $seenPackages.Contains($pkgDesc)) {
                    $null = $seenPackages.Add($pkgDesc)
                    $data.ApplicableUpdates.Add([hashtable]@{
                        Description = $pkgDesc
                        RebootType  = '-'
                        PackageID   = $pkgId
                    })
                }
            }
        }

        # Errors and warnings
        if ($entryLevel -eq 'Warning' -or $entryLevel -eq 'Severe') {
            $levelMapped = if ($entryLevel -eq 'Severe') { 'Error' } else { 'Warn' }
            $flatMsg     = $msg -replace "`n", ' | '
            $benign      = Test-Benign -Source $entrySource -Msg $flatMsg
            if ($benign) { $data.BenignCount++ }
            $data.Issues.Add([hashtable]@{
                Timestamp = $entryTs
                Level     = $levelMapped
                Source    = $entrySource
                Message   = $flatMsg
                IsBenign  = $benign
            })
        }

        $entryTs     = ''
        $entrySource = ''
    }

    $reader = [System.IO.StreamReader]::new($Path, [System.Text.Encoding]::UTF8)
    try {
        $skipFirst = $true
        while (-not $reader.EndOfStream) {
            $line = $reader.ReadLine()
            if ($null -eq $line) { continue }

            # Skip the header line (already parsed above)
            if ($skipFirst) { $skipFirst = $false; continue }

            # Blank line: end of current entry
            if ($line -eq '') {
                . $processEntry
                continue
            }

            # Entry-start line: "Info\t2026-01-26 , 10:40:14.705"
            if ($line -match '^(?<level>Info|Warning|Severe)\t(?<ts>\d{4}-\d{2}-\d{2}) , (?<time>\d{2}:\d{2}:\d{2})') {
                . $processEntry   # flush any open entry first
                $entryLevel  = $Matches['level']
                $entryTs     = $Matches['ts'] + ' ' + $Matches['time']
                $entrySource = ''
                $msgLines.Clear()
                $inMsg = $false
                continue
            }

            # Tab-indented lines: method name or message content
            if ($line -match '^\t') {
                $trimmed = $line.TrimStart("`t").Trim()

                if (-not $inMsg) {
                    # "Message: ..." starts the message body
                    if ($trimmed -match '^Message:\s*(?<m>.*)') {
                        $inMsg = $true
                        $firstPart = $Matches['m']
                        if ($firstPart -ne '') { $msgLines.Add($firstPart) }
                    }
                    # Method/source line (before the Message: line)
                    elseif ($entrySource -eq '') {
                        # Strip leading special chars and "at " prefix, then grab last ClassName.Method before "("
                        $cleaned = $trimmed -replace '^(at\s+|[\W_]+)', ''
                        if ($cleaned -match '(?<src>[\w.<>]+\.[\w.<>]+)\(') {
                            $entrySource = $Matches['src']
                        } else {
                            $entrySource = ($cleaned -replace '\(.*$', '').Trim()
                        }
                    }
                }
                else {
                    $msgLines.Add($trimmed)
                }
                continue
            }

            # Non-tab-indented continuation (e.g. space-indented package lines, SQL text)
            if ($inMsg) {
                $msgLines.Add($line.Trim())
            }
        }
        # Flush final entry
        . $processEntry
    }
    finally {
        $reader.Close()
        $reader.Dispose()
    }

    Write-Verbose "Old-format parse complete. History packages: $($data.ApplicableUpdates.Count). Issues: $($data.Issues.Count) ($($data.BenignCount) benign)."
    return $data
}

# ============================================================
#  Log file parser — dispatches to old or new format parser
# ============================================================
function Invoke-ParseLogFile {
    param([string]$Path)

    # Detect format from the first line of the file.
    $firstLine = ''
    $peek = [System.IO.StreamReader]::new($Path, [System.Text.Encoding]::UTF8)
    try { $firstLine = $peek.ReadLine() } finally { $peek.Close(); $peek.Dispose() }

    if ($firstLine -match '^\[Lenovo System Update Addin build:') {
        Write-Verbose "Detected old log format (build header present)."
        return Invoke-ParseOldLog -Path $Path -HeaderLine $firstLine
    }

    Write-Verbose "Detected new log format (timestamped lines)."

    # Result data object — all fields initialized so strict mode is satisfied.
    $data = [ordered]@{
        FileName          = [System.IO.Path]::GetFileName($Path)
        # Session
        SessionStart      = ''
        SessionEnd        = ''
        SessionComplete   = $false
        AddinVersion      = ''
        # System
        MTM               = ''
        OS                = ''
        Language          = ''
        LCID              = ''
        BIOSVersion       = ''
        CatalogURL        = ''
        CatalogCount      = -1
        GPAutoUpdate      = ''
        # Schedule
        Schedule          = [ordered]@{}
        # Scan
        ScanStart         = ''
        ScanEnd           = ''
        ScanStatusCode    = -1
        ApplicableUpdates = [System.Collections.Generic.List[hashtable]]::new()
        # Install
        InstallRequested  = $false
        DLOnly            = 0
        InstallOnly       = 0
        DLAndInstall      = 0
        RebootNeeded      = $null
        InstallResults    = [System.Collections.Generic.List[hashtable]]::new()
        # Issues
        Issues            = [System.Collections.Generic.List[hashtable]]::new()
        BenignCount       = 0
    }

    # ---- State machine variables ----
    $inAfterSort      = $false   # collecting lines from "After sort update list:" block
    $inCandidateList  = $false   # collecting lines from "Candidate list:" block (fallback)
    $expectInstallLen = ''       # which install list we're waiting for the "length:" of

    $reader = [System.IO.StreamReader]::new($Path, [System.Text.Encoding]::UTF8)
    try {
        while (-not $reader.EndOfStream) {
            $line = $reader.ReadLine()
            if ($null -eq $line) { continue }

            # ------------------------------------------------------------------
            # Timestamped log line
            # ------------------------------------------------------------------
            if ($line -match $RE.LogLine) {
                $ts     = $Matches['ts']
                $level  = $Matches['level']
                $source = $Matches['source']
                $msg    = $Matches['msg']

                # End any active multi-line collection states.
                $inAfterSort     = $false
                $inCandidateList = $false
                $expectInstallLen = ''

                # Session timestamps
                if ($data.SessionStart -eq '') { $data.SessionStart = $ts }
                $data.SessionEnd = $ts

                # ---- Session ----
                if ($data.AddinVersion -eq '' -and $source -eq 'Program.Start' -and $msg -match $RE.AddinVersion) {
                    $data.AddinVersion = $Matches['ver']
                }
                if ($msg -match $RE.Terminating) {
                    $data.SessionComplete = $true
                }

                # ---- System info ----
                if ($data.MTM -eq '' -and $msg -match $RE.MTM) {
                    $data.MTM = $Matches['mtm']
                }
                if ($data.LCID -eq '' -and $msg -match $RE.LCID) {
                    $data.LCID = $Matches['lcid']
                }
                if ($data.BIOSVersion -eq '' -and $msg -match $RE.BIOS) {
                    $data.BIOSVersion = ($Matches['bios']).Trim()
                }
                if ($data.CatalogURL -eq '' -and $msg -match $RE.CatalogURL) {
                    $data.CatalogURL = $Matches['url']
                }
                if ($data.CatalogCount -eq -1 -and $msg -match $RE.CatalogCount) {
                    $data.CatalogCount = [int]$Matches['count']
                }
                if ($data.GPAutoUpdate -eq '' -and $msg -match $RE.GPPolicy) {
                    $data.GPAutoUpdate = $Matches['gp']
                }

                # ---- Scan phase tracking ----
                if ($msg -match $RE.ScanPhase) {
                    try {
                        $phase = $Matches['json'] | ConvertFrom-Json -ErrorAction Stop
                        if ($phase.phase -eq 'CheckForUpdates') {
                            if ($phase.subPhase -eq 'ScanInitiated' -and $data.ScanStart -eq '') {
                                $data.ScanStart = $ts
                            }
                            if ($phase.subPhase -eq 'ScanCompleted') {
                                $data.ScanEnd       = $ts
                                $data.ScanStatusCode = [int]$phase.statusCode
                            }
                        }
                    }
                    catch { Write-Verbose "Scan phase JSON parse error: $_" }
                }

                # ---- Update list headers ----
                if ($source -match $RE.AfterSortSrc -and $msg -match $RE.AfterSortMsg) {
                    $inAfterSort = $true
                    $data.ApplicableUpdates.Clear()   # prefer after-sort over candidate list
                }
                elseif ($data.ApplicableUpdates.Count -eq 0 -and $source -match $RE.CandidateSrc -and $msg -match $RE.CandidateMsg) {
                    $inCandidateList = $true
                }

                # ---- Install tracking ----
                if ($msg -match $RE.InstallCmd) {
                    $data.InstallRequested = $true
                }
                if ($msg -match $RE.InstallList) {
                    $expectInstallLen = $Matches['type']
                }

                # Per-package install metrics
                if ($msg -match $RE.SendMetrics) {
                    $rawInstTime = ($Matches['time']) -replace ',', '.'
                    $installTimeVal = $null
                    try { $installTimeVal = [double]$rawInstTime } catch {}
                    $data.InstallResults.Add([hashtable]@{
                        PackageID    = $Matches['id']
                        Status       = $Matches['status']
                        Result       = $Matches['result']
                        InstallTime  = $installTimeVal
                        ActionResult = ''
                        InstallDate  = ''
                    })
                }

                # ---- Errors and warnings ----
                if ($level -eq 'Warn' -or $level -eq 'Error') {
                    $benign = Test-Benign -Source $source -Msg $msg
                    if ($benign) {
                        $data.BenignCount++
                    }
                    $data.Issues.Add([hashtable]@{
                        Timestamp = $ts
                        Level     = $level
                        Source    = $source
                        Message   = $msg
                        IsBenign  = $benign
                    })
                }
            }
            # ------------------------------------------------------------------
            # Continuation line (no leading timestamp)
            # ------------------------------------------------------------------
            else {
                $trimmed = $line.Trim()
                if ($trimmed -eq '') { continue }

                # After-sort update list entries
                if ($inAfterSort) {
                    if ($trimmed -match $RE.InstallLen) {
                        # "length: N" — just informational here, we count by entries added
                    }
                    elseif ($trimmed -match $RE.UpdateEntry) {
                        $data.ApplicableUpdates.Add([hashtable]@{
                            Description = ($Matches['desc']).Trim()
                            RebootType  = Get-RebootLabel -Code $Matches['rbt']
                        })
                    }
                }
                # Candidate list entries (fallback if no after-sort block found)
                elseif ($inCandidateList) {
                    if ($trimmed -match $RE.UpdateEntry) {
                        $data.ApplicableUpdates.Add([hashtable]@{
                            Description = ($Matches['desc']).Trim()
                            RebootType  = Get-RebootLabel -Code $Matches['rbt']
                        })
                    }
                }
                # Install list length (e.g. "length: 1" after "DownloadAndInstall update list:")
                elseif ($expectInstallLen -ne '' -and $trimmed -match $RE.InstallLen) {
                    $len = [int]$Matches['len']
                    switch ($expectInstallLen) {
                        'DownloadOnly'       { $data.DLOnly       = $len }
                        'InstallOnly'        { $data.InstallOnly   = $len }
                        'DownloadAndInstall' { $data.DLAndInstall  = $len }
                    }
                    $expectInstallLen = ''
                }
                # OS / Language from HelloProcess multi-line block
                elseif ($data.OS -eq '' -and $trimmed -match $RE.QOS) {
                    $data.OS = ($Matches['os']).Trim()
                }
                elseif ($data.Language -eq '' -and $trimmed -match $RE.QOSLang) {
                    $data.Language = ($Matches['lang']).Trim()
                }

                # Payload line inside any HandleRequest/HandleResponse block
                # Parse schedule, GP policy, and install results from embedded JSON strings.
                if ($trimmed -match $RE.PayloadLine) {
                    $jsonStr = ($Matches['json']) -replace '\\"', '"'

                    # GP auto-update policy
                    if ($data.GPAutoUpdate -eq '' -and $jsonStr -like '*isAutoUpdateControlByGP*') {
                        if ($jsonStr -match $RE.GPPolicy) {
                            $data.GPAutoUpdate = $Matches['gp']
                        }
                    }

                    # Schedule data
                    if ($data.Schedule.Count -eq 0 -and $jsonStr -like '*scheduleList*') {
                        try {
                            $pl = $jsonStr | ConvertFrom-Json -ErrorAction Stop
                            if ($null -ne $pl.scheduleList) {
                                foreach ($item in $pl.scheduleList) {
                                    $data.Schedule[$item.name] = $item.value
                                }
                            }
                        }
                        catch { Write-Verbose "Schedule JSON parse error: $_" }
                    }

                    # Install result data
                    if ($null -eq $data.RebootNeeded -and $jsonStr -like '*updateResultList*') {
                        try {
                            $pl = $jsonStr | ConvertFrom-Json -ErrorAction Stop
                            if ($null -ne $pl.rebootNeeded) {
                                $data.RebootNeeded = [bool]$pl.rebootNeeded
                            }
                            if ($null -ne $pl.updateResultList) {
                                foreach ($r in $pl.updateResultList) {
                                    # Match back to existing SendMetrics entry by package ID
                                    $found = $false
                                    for ($i = 0; $i -lt $data.InstallResults.Count; $i++) {
                                        if ($data.InstallResults[$i].PackageID -eq $r.packageID) {
                                            $data.InstallResults[$i].ActionResult = [string]$r.actionResult
                                            $data.InstallResults[$i].InstallDate  = [string]$r.installDate
                                            $found = $true
                                            break
                                        }
                                    }
                                    if (-not $found) {
                                        $data.InstallResults.Add([hashtable]@{
                                            PackageID    = [string]$r.packageID
                                            Status       = 'installed'
                                            Result       = [string]$r.actionResult
                                            InstallTime  = -1
                                            ActionResult = [string]$r.actionResult
                                            InstallDate  = [string]$r.installDate
                                        })
                                    }
                                }
                            }
                        }
                        catch { Write-Verbose "Install result JSON parse error: $_" }
                    }
                }
            }
        }
    }
    finally {
        $reader.Close()
        $reader.Dispose()
    }

    Write-Verbose "Parse complete. Updates found: $($data.ApplicableUpdates.Count). Issues: $($data.Issues.Count) ($($data.BenignCount) benign)."
    return $data
}

# ============================================================
#  Section display functions
# ============================================================

function Show-SessionInfo {
    param($Data)
    Write-SectionHeader 'SESSION INFO'

    Write-Field 'Log File'      (Coalesce $Data.FileName)
    Write-Field 'Addin Version' (Coalesce $Data.AddinVersion)
    Write-Field 'Session Start' (Coalesce $Data.SessionStart)
    Write-Field 'Session End'   (Coalesce $Data.SessionEnd)

    if ($Data.SessionStart -ne '' -and $Data.SessionEnd -ne '') {
        try {
            $fmt   = 'yyyy-MM-dd HH:mm:ss'
            $start = [datetime]::ParseExact($Data.SessionStart.Substring(0,19), $fmt, $null)
            $end   = [datetime]::ParseExact($Data.SessionEnd.Substring(0,19),   $fmt, $null)
            $span  = $end - $start
            if ($span.TotalSeconds -lt 0) {
                Write-Field 'Duration' '(invalid -- end timestamp precedes start)' -Color 'Yellow'
            } else {
                Write-Field 'Duration' (Format-Span -Span $span)
            }
        }
        catch {
            Write-Field 'Duration' '(could not calculate)'
        }
    }
    else {
        Write-Field 'Duration' '(not available)'
    }

    if (-not $Data.SessionComplete) {
        Write-Out '  * Session may be incomplete (no AddinHost.Terminating event found)' DarkYellow
    }
}

function Show-SystemInfo {
    param($Data)
    Write-SectionHeader 'SYSTEM INFO'

    Write-Field 'Machine Type'  (Coalesce $Data.MTM)
    Write-Field 'OS'            (Coalesce $Data.OS)
    Write-Field 'Language'      (Coalesce $Data.Language)
    Write-Field 'LCID'          (Coalesce $Data.LCID)
    Write-Field 'BIOS'          (Coalesce $Data.BIOSVersion)

    if ($Data.CatalogURL -ne '') {
        $catalogFile = $Data.CatalogURL -replace '^.+/', ''
        Write-Field 'Catalog' $catalogFile
    }
    else {
        Write-Field 'Catalog' '(not found)'
    }

    if ($Data.GPAutoUpdate -ne '') {
        $gpLabel = if ($Data.GPAutoUpdate -eq 'true') {
            'Controlled by Group Policy'
        } else {
            'Not controlled by Group Policy'
        }
        Write-Field 'GP Auto-Update' $gpLabel
    }
    else {
        Write-Field 'GP Auto-Update' '(not found)'
    }
}

function Show-UpdateSchedule {
    param($Data)
    Write-SectionHeader 'UPDATE SCHEDULE'

    if ($Data.Schedule.Count -eq 0) {
        Write-Out '  (Schedule information not found in log)' Gray
        return
    }

    $s = $Data.Schedule

    function Get-Sched { param([string]$Key) if ($s.Contains($Key)) { $s[$Key] } else { '(unknown)' } }

    $freq    = Get-Sched 'Frequency'
    $week    = Get-Sched 'WeeksOfMonth'
    $day     = Get-Sched 'DayOfWeek'
    $utc     = Get-Sched 'UTCTimeToCheck'
    $pkg     = Get-Sched 'PackageType'
    $sched   = Get-Sched 'SchedulerAbility'
    $notify  = Get-Sched 'Notify'
    $rec     = Get-Sched 'RecommendedAutoUpdates'
    $drv     = Get-Sched 'DriversAndOtherAutoUpdates'
    $bios    = Get-Sched 'BIOSAndFirmwareAutoUpdates'

    $freqFull = $freq
    if ($week -ne '(unknown)' -and $day -ne '(unknown)') {
        $freqFull = "$freq ($week $day)"
    }

    Write-Field 'Frequency'         $freqFull
    Write-Field 'Package Type'      $pkg
    Write-Field 'Check Time (UTC)'  $utc
    Write-Field 'Scheduler'         $sched
    Write-Field 'Notify Mode'       $notify
    Write-Field 'Recommended Auto'  $rec
    Write-Field 'Drivers Auto'      $drv
    Write-Field 'BIOS/FW Auto'      $bios
}

function Show-ScanResults {
    param($Data)
    Write-SectionHeader 'SCAN RESULTS'

    # Catalog info
    if ($Data.CatalogCount -ge 0) {
        $catInfo = "$($Data.CatalogCount) packages in catalog"
        if ($Data.CatalogURL -ne '') {
            $catInfo += " ($($Data.CatalogURL -replace '^.+/', ''))"
        }
        Write-Field 'Catalog' $catInfo
    }
    else {
        Write-Field 'Catalog' '(not found)'
    }

    # Scan duration
    if ($Data.ScanStart -ne '' -and $Data.ScanEnd -ne '') {
        try {
            $fmt  = 'yyyy-MM-dd HH:mm:ss.fff'
            $s    = [datetime]::ParseExact($Data.ScanStart.Substring(0,23), $fmt, $null)
            $e    = [datetime]::ParseExact($Data.ScanEnd.Substring(0,23),   $fmt, $null)
            $dur  = $e - $s
            $code = if ($Data.ScanStatusCode -eq 0) { 'Success' } else { "Code $($Data.ScanStatusCode)" }
            Write-Field 'Scan Duration' ('{0} ({1})' -f (Format-Span -Span $dur), $code)
        }
        catch {
            Write-Field 'Scan Duration' '(could not calculate)'
        }
    }
    else {
        Write-Field 'Scan Duration' '(not found in this log)'
    }

    # Applicable update count
    $count = $Data.ApplicableUpdates.Count
    $countColor = if ($count -gt 0) { 'Yellow' } else { 'Green' }
    # Old-format logs show update history rather than a live scan result
    $updateListLabel = if ($Data.ScanStart -eq '' -and $count -gt 0) {
        "$count packages (from update history -- no scan in this session)"
    } else {
        "$count found"
    }
    Write-Field 'Applicable Updates' $updateListLabel -Color $countColor

    if ($count -eq 0) { return }

    # Update table
    Write-Out ''
    $hdr = '  {0,-62} {1}' -f 'Description', 'Reboot'
    Write-Out $hdr White
    Write-Out ('  ' + ('-' * 74)) Gray

    foreach ($upd in $Data.ApplicableUpdates) {
        $desc   = $upd.Description
        if ($desc.Length -gt 60) { $desc = $desc.Substring(0, 57) + '...' }
        $reboot = $upd.RebootType
        $rebootColor = switch ($reboot) {
            'None'      { 'Green'      }
            'Requested' { 'Yellow'     }
            'Delayed'   { 'DarkYellow' }
            'Forced'    { 'Red'        }
            default     { 'White'      }
        }

        $rowText = '  {0,-62} {1}' -f $desc, $reboot
        # Console: color the whole row by reboot severity
        Write-Host $rowText -ForegroundColor $rebootColor
        if ($script:DoCapture) { $script:CaptureLines.Add($rowText) }
    }
}

function Show-InstallResults {
    param($Data)
    Write-SectionHeader 'INSTALL RESULTS'

    if (-not $Data.InstallRequested) {
        Write-Out '  No install was performed in this session.' Gray
        return
    }

    Write-Field 'Download-Only'        "$($Data.DLOnly)"
    Write-Field 'Install-Only'         "$($Data.InstallOnly)"
    Write-Field 'Download-and-Install' "$($Data.DLAndInstall)"

    if ($null -ne $Data.RebootNeeded) {
        if ($Data.RebootNeeded) {
            Write-Field 'Reboot Needed' 'YES' -Color 'Yellow'
        } else {
            Write-Field 'Reboot Needed' 'No'  -Color 'Green'
        }
    }
    else {
        Write-Field 'Reboot Needed' '(not found)'
    }

    if ($Data.InstallResults.Count -eq 0) {
        Write-Out ''
        Write-Out '  (No per-package install metrics found in log)' Gray
        return
    }

    Write-Out ''
    $hdr = '  {0,-14} {1,-9} {2,-10} {3}' -f 'Package ID', 'Result', 'Time (s)', 'Install Date'
    Write-Out $hdr White
    Write-Out ('  ' + ('-' * 60)) Gray

    foreach ($r in $Data.InstallResults) {
        $result = if ($r.ActionResult -ne '') { $r.ActionResult } elseif ($r.Result -ne '') { $r.Result } else { '(unknown)' }
        $resultColor = switch -Wildcard ($result) {
            'Success' { 'Green'  }
            'Fail*'   { 'Red'    }
            default   { 'Yellow' }
        }
        $time = if ($null -ne $r.InstallTime) { '{0:N2}' -f ([double]$r.InstallTime) } else { '-' }
        $date = if ($r.InstallDate -ne '') { $r.InstallDate -replace 'T', ' ' } else { '-' }

        Write-InstallRow -PkgId $r.PackageID -Result $result -ResultColor $resultColor -TimeSec $time -InstallDate $date
    }
}

function Show-Issues {
    param($Data)
    Write-SectionHeader 'ERRORS & WARNINGS'

    # Build the visible list as a guaranteed [object[]] so .Count is always available.
    [object[]]$visible = @()
    if ($IncludeBenign) {
        [object[]]$visible = @($Data.Issues)
    } else {
        [object[]]$visible = @($Data.Issues | Where-Object { -not $_.IsBenign })
    }

    if ($visible.Count -eq 0 -and $Data.BenignCount -eq 0) {
        Write-Out '  No errors or warnings found.' Green
        return
    }

    if ($visible.Count -eq 0) {
        Write-Out '  No notable errors or warnings found.' Green
    }
    else {
        foreach ($issue in $visible) {
            $timeShort = $issue.Timestamp.Substring(11)   # HH:mm:ss.fff portion
            $lvl       = $issue.Level.ToUpper().PadRight(5)
            $src       = $issue.Source
            $msg       = $issue.Message
            if ($msg.Length -gt 110) { $msg = $msg.Substring(0, 107) + '...' }

            $color = if ($issue.Level -eq 'Error') { 'Red' } else { 'DarkYellow' }
            Write-Out "  [$timeShort] $lvl [$src]" $color
            Write-Out "        $msg" $color
        }
    }

    if (-not $IncludeBenign -and $Data.BenignCount -gt 0) {
        Write-Out ''
        Write-Out "  ($($Data.BenignCount) benign/known-harmless entries suppressed -- use -IncludeBenign to show all)" Gray
    }
}

# ============================================================
#  Main execution
# ============================================================

# --- Validate the input file ---
if (-not (Test-Path -LiteralPath $LogFile -PathType Leaf)) {
    Write-Error "Log file not found: $LogFile"
    return
}

$resolvedLog = (Resolve-Path -LiteralPath $LogFile).Path
$fileName    = [System.IO.Path]::GetFileName($resolvedLog)

if ($fileName -notmatch '^LenovoSystemUpdateAddin_' -and $fileName -notmatch '^tvsu_') {
    Write-Warning "File '$fileName' does not match a known LSU Addin log naming pattern. Continuing anyway."
}

# --- Validate / prepare the output file ---
if ($OutputFile -ne '') {
    if ((Test-Path -LiteralPath $OutputFile -PathType Leaf) -and -not $Force) {
        $answer = Read-Host "Output file '$OutputFile' already exists. Overwrite? (Y/N)"
        if ($answer -notmatch '^[Yy]') {
            Write-Host 'Aborted.' -ForegroundColor Yellow
            return
        }
    }
    $script:DoCapture = $true
}

# --- Parse the log file ---
Write-Verbose "Parsing: $resolvedLog"
$data = Invoke-ParseLogFile -Path $resolvedLog

# --- Determine active sections ---
$activeSections = if ($null -ne $Sections -and $Sections.Count -gt 0 -and $Sections -notcontains 'All') { $Sections } else { $ALL_SECTIONS }

# --- Write report ---
Write-ReportHeader 'LCV Log File Viewer - Session Summary'

if ($activeSections -contains 'SessionInfo')    { Show-SessionInfo    -Data $data }
if ($activeSections -contains 'SystemInfo')     { Show-SystemInfo     -Data $data }
if ($activeSections -contains 'UpdateSchedule') { Show-UpdateSchedule -Data $data }
if ($activeSections -contains 'ScanResults')    { Show-ScanResults    -Data $data }
if ($activeSections -contains 'InstallResults') { Show-InstallResults -Data $data }
if (($activeSections -contains 'Errors') -or ($activeSections -contains 'Warnings')) {
    Show-Issues -Data $data
}

Write-Out ''
Write-Out ('=' * 62) Cyan

# --- Write output file ---
if ($script:DoCapture) {
    $fileHeader = @(
        ('=' * 62),
        '  LCV Log File Viewer - Session Summary Report',
        ('  Generated : ' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')),
        ('  Source    : ' + $resolvedLog),
        ('  Script    : ' + $SCRIPT_NAME + ' v' + $SCRIPT_VERSION),
        ('=' * 62),
        ''
    )
    $allLines = $fileHeader + $script:CaptureLines

    try {
        $enc = [System.Text.UTF8Encoding]::new($true)   # UTF-8 with BOM
        [System.IO.File]::WriteAllLines($OutputFile, $allLines, $enc)
        Write-Host "`nReport written to: $OutputFile" -ForegroundColor Green
    }
    catch {
        Write-Error "Could not write output file '$OutputFile': $_"
    }
}

}

# SIG # Begin signature block
