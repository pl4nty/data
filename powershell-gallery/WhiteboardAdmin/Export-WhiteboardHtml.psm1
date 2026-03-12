<#
.SYNOPSIS
    Exports Microsoft Whiteboards to HTML format using the Microsoft Graph API.

.DESCRIPTION
    Supports two modes:

    USER MODE (-Mode User)
        Connects as the currently signed-in user (delegated auth) and exports all of
        their whiteboards to:
            <Downloads>\WhiteboardExports\<Whiteboard Name>.html

        Required permissions (delegated):
            User.Read      - read own profile / resolve signed-in user ID
            Files.Read     - read own OneDrive and trigger content format conversion

    ADMIN MODE (-Mode Admin)
        Connects as a tenant admin and exports whiteboards for all users, or a subset
        provided via -UserListCsv / -UserList, to:
            <Downloads>\WhiteboardExports_<TenantId>\<user@domain>\<Whiteboard Name>.html

        Required permissions (delegated, admin-consented):
            User.Read.All  - enumerate tenant users
            Files.Read.All - read any user's OneDrive and trigger content format conversion

    The HTML is produced by the Graph "content format transform" endpoint:
        GET /users/{user-id}/drive/items/{item-id}/content?format=html

    Features:
        - Resume interrupted runs (state saved to export_state.json)
        - Per-whiteboard retry (up to 3 attempts, 3-second back-off)
        - -RetryFailed to re-attempt previously failed exports
        - -Force to start a completely fresh run
        - Progress bars with ETA at both user and whiteboard level
        - Detailed log file (export_log.txt) with timestamps
        - Summary JSON and console report at completion

.PARAMETER Mode
    Required. 'User' to export the signed-in user's own whiteboards.
              'Admin' to export whiteboards for all or selected tenant users.

.PARAMETER TenantId
    Required in Admin mode. Tenant ID (GUID or domain, e.g. contoso.onmicrosoft.com).

.PARAMETER UserListCsv
    Admin mode only. Path to a CSV whose first column (or a column named
    'UserPrincipalName') contains UPNs. If omitted, all tenant users are processed.

.PARAMETER UserList
    Admin mode only. Inline array of UPNs:
        -UserList @('alice@contoso.com','bob@contoso.com')
    Ignored when -UserListCsv is also supplied.

.PARAMETER OutputPath
    Base directory for the output folder. Defaults to the user's Downloads folder.

.PARAMETER Force
    Discard any saved state and start a completely fresh run.

.PARAMETER LogLevel
    Console verbosity. One of: Quiet | Normal | Verbose. Default: Normal.
    All levels are always written to the log file.

.PARAMETER ThrottleDelayMs
    Milliseconds to pause between Graph API calls. Default: 100.
    Increase to 300-500 for large tenants or when experiencing throttling.

.PARAMETER MaxUsers
    Admin mode only. Maximum number of users to process. Default: 9999.

.PARAMETER Environment
    Required. Target Microsoft cloud. Must be specified explicitly to prevent accidentally
    connecting a tenant to the wrong cloud endpoint.
    AzureCloud        - Public / GCC (graph.microsoft.com)
    AzureUSGovernment - GCC-High (graph.microsoft.us)
    AzureUSDoD        - DoD (dod-graph.microsoft.us)
    AzureUSNat        - Air-Gap / USNat (graph.eaglex.ic.gov)
    AzureUSSec        - Air-Gap / USSec (graph.microsoft.scloud)

.EXAMPLE
    # First-time setup: allow the script to run (run once as the current user)
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

.EXAMPLE
    # Export the signed-in user's own whiteboards
    .\Export-WhiteboardHtml.ps1 -Mode User

.EXAMPLE
    # Export all tenant users' whiteboards (admin)
    .\Export-WhiteboardHtml.ps1 -Mode Admin -TenantId contoso.onmicrosoft.com

.EXAMPLE
    # Export for a GCC-High tenant
    .\Export-WhiteboardHtml.ps1 -Mode Admin -TenantId contoso.onmicrosoft.com -Environment AzureUSGovernment

.EXAMPLE
    # Export for a DoD tenant
    .\Export-WhiteboardHtml.ps1 -Mode Admin -TenantId contoso.onmicrosoft.com -Environment AzureUSDoD

.EXAMPLE
    # Export for users listed in a CSV
    .\Export-WhiteboardHtml.ps1 -Mode Admin -TenantId contoso.onmicrosoft.com `
        -UserListCsv C:\migration\users.csv

.EXAMPLE
    # Export for a specific set of users
    .\Export-WhiteboardHtml.ps1 -Mode Admin -TenantId contoso.onmicrosoft.com `
        -UserList @('alice@contoso.com', 'bob@contoso.com')

.EXAMPLE
    # Force a completely fresh run (discard saved state)
    .\Export-WhiteboardHtml.ps1 -Mode Admin -TenantId contoso.onmicrosoft.com -Force
#>

function Export-WhiteboardHtml {
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('User', 'Admin')]
    [string]$Mode,

    [Parameter(Mandatory = $false)]
    [string]$TenantId,

    [Parameter(Mandatory = $false)]
    [string]$UserListCsv,

    [Parameter(Mandatory = $false)]
    [string[]]$UserList = @(),

    [Parameter(Mandatory = $false)]
    [string]$OutputPath,

    [Parameter(Mandatory = $false)]
    [switch]$Force,

    [Parameter(Mandatory = $false)]
    [ValidateSet('Quiet', 'Normal', 'Verbose')]
    [string]$LogLevel = 'Normal',

    [Parameter(Mandatory = $false)]
    [int]$ThrottleDelayMs = 100,

    [Parameter(Mandatory = $false)]
    [int]$MaxUsers = 9999,

    [Parameter(Mandatory = $false)]
    [string]$LoginAs,

    [Parameter(Mandatory = $true)]
    [ValidateSet('AzureCloud', 'AzureUSGovernment', 'AzureUSDoD', 'AzureUSNat', 'AzureUSSec')]
    [string]$Environment
)

$ErrorActionPreference = 'Stop'

# ── Environment → Graph base URL and Connect-MgGraph environment name ────────────
# AzureCloud        → graph.microsoft.com               (Connect-MgGraph: Global)
# AzureUSGovernment → graph.microsoft.us                (Connect-MgGraph: USGov)
# AzureUSDoD        → dod-graph.microsoft.us            (Connect-MgGraph: USGovDoD)
# AzureUSNat        → graph.eaglex.ic.gov               (air-gapped; pre-configured SDK)
# AzureUSSec        → graph.microsoft.scloud            (air-gapped; pre-configured SDK)
$script:graphBaseUrl = switch ($Environment) {
    'AzureUSGovernment' { 'https://graph.microsoft.us' }
    'AzureUSDoD'        { 'https://dod-graph.microsoft.us' }
    'AzureUSNat'        { 'https://graph.eaglex.ic.gov' }
    'AzureUSSec'        { 'https://graph.microsoft.scloud' }
    default             { 'https://graph.microsoft.com' }   # AzureCloud
}
$script:mgEnvironment = switch ($Environment) {
    'AzureUSGovernment' { 'USGov' }
    'AzureUSDoD'        { 'USGovDoD' }
    'AzureUSNat'        { 'USNat' }
    'AzureUSSec'        { 'USSec' }
    default             { 'Global' }
}

# ── Required Permissions Reference ──────────────────────────────────────────────
# USER MODE  (delegated)  : User.Read, Files.Read
# ADMIN MODE (delegated)  : User.Read.All, Files.Read.All
#   Admin consent required for Files.Read.All and User.Read.All.
#   Grant via: Entra ID > App registrations > Microsoft Graph PowerShell >
#   API Permissions > Add a permission > Microsoft Graph > Delegated.
# ────────────────────────────────────────────────────────────────────────────────

#region ── Parameter validation ─────────────────────────────────────────────────

if ($Mode -eq 'Admin' -and [string]::IsNullOrWhiteSpace($TenantId)) {
    Write-Error "Admin mode requires -TenantId. Example: -TenantId contoso.onmicrosoft.com"
}

if ($UserListCsv -and -not (Test-Path $UserListCsv)) {
    Write-Error "User list CSV not found: $UserListCsv"
}

#endregion

#region ── Output folders ────────────────────────────────────────────────────────

$downloadsRoot = if ($OutputPath) { $OutputPath } else { Join-Path $env:USERPROFILE 'Downloads' }

$baseOutDir = if ($Mode -eq 'User') {
    Join-Path $downloadsRoot 'WhiteboardExports'
} else {
    Join-Path $downloadsRoot "WhiteboardExports_$TenantId"
}

New-Item -ItemType Directory -Path $baseOutDir -Force | Out-Null

$script:logFile     = Join-Path $baseOutDir 'export_log.txt'
$stateFile          = Join-Path $baseOutDir 'export_state.json'
$summaryFile        = Join-Path $baseOutDir 'export_summary.json'

#endregion

#region ── Logging ───────────────────────────────────────────────────────────────

function Write-Log {
    param(
        [string]$Message,
        [ValidateSet('INFO', 'SUCCESS', 'WARNING', 'ERROR', 'DEBUG')]
        [string]$Level = 'INFO',
        [switch]$AlwaysShow
    )

    $ts    = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    Add-Content -Path $script:logFile -Value "[$ts] [$Level] $Message" -Encoding UTF8

    $show = $AlwaysShow -or (
        $LogLevel -eq 'Verbose' -or
        ($LogLevel -eq 'Normal' -and $Level -in @('INFO','SUCCESS','WARNING','ERROR')) -or
        ($LogLevel -eq 'Quiet'  -and $Level -in @('SUCCESS','ERROR'))
    )

    if (-not $show) { return }

    $color = switch ($Level) {
        'SUCCESS' { 'Green'  }
        'WARNING' { 'Yellow' }
        'ERROR'   { 'Red'    }
        'DEBUG'   { 'Gray'   }
        default   { 'White'  }
    }
    Write-Host $Message -ForegroundColor $color
}

#endregion

#region ── Progress bars ─────────────────────────────────────────────────────────

function Show-Progress {
    param(
        [int]$Current,
        [int]$Total,
        [string]$Activity,
        [string]$Status,
        [datetime]$StartTime,
        [int]$Id = 0,
        [int]$ParentId = -1
    )

    $pct = if ($Total -gt 0) { [math]::Min(100, [int](($Current / $Total) * 100)) } else { 0 }

    $etaStr = ''
    if ($Current -gt 0 -and $Total -gt $Current) {
        $elapsed = (Get-Date) - $StartTime
        $eta     = [TimeSpan]::FromSeconds(($elapsed.TotalSeconds / $Current) * ($Total - $Current))
        $etaStr  = "  ETA {0:D2}h {1:D2}m {2:D2}s" -f $eta.Hours, $eta.Minutes, $eta.Seconds
    }

    $params = @{
        Id               = $Id
        Activity         = $Activity
        Status           = "$Status$etaStr"
        PercentComplete  = $pct
        CurrentOperation = "$Current / $Total"
    }
    if ($ParentId -ge 0) { $params.ParentId = $ParentId }
    Write-Progress @params
}

#endregion

#region ── State management ──────────────────────────────────────────────────────

function New-RunState {
    return [ordered]@{
        mode           = $Mode
        tenantId       = $TenantId
        environment    = $Environment
        graphBaseUrl   = $script:graphBaseUrl
        startedAt      = (Get-Date -Format 'o')
        lastUpdatedAt  = (Get-Date -Format 'o')
        status         = 'in_progress'
        processedUsers = @()
        exportedFiles  = [ordered]@{}   # UPN -> string[]  of exported file names
        failedExports  = @()            # PSCustomObject[]
        stats          = [ordered]@{
            totalUsers           = 0
            usersProcessed       = 0
            usersWithWhiteboards = 0
            usersNoOneDrive      = 0
            usersNoWhiteboards   = 0
            totalWhiteboards     = 0
            successfulExports    = 0
            failedExports        = 0
        }
    }
}

function Get-SavedState {
    if ($Force) {
        Write-Log 'Force flag set - discarding previous state.' 'WARNING' -AlwaysShow
        return $null
    }
    if (-not (Test-Path $stateFile)) { return $null }
    try {
        $s = Get-Content $stateFile -Raw | ConvertFrom-Json
        if ($s.status -eq 'in_progress') {
            Write-Log "Resuming previous run (started $($s.startedAt))." 'INFO' -AlwaysShow
            return $s
        }
    } catch {
        Write-Log 'Could not parse saved state - starting fresh.' 'WARNING'
    }
    return $null
}

function Save-State {
    param([object]$s)
    $s.lastUpdatedAt = (Get-Date -Format 'o')
    $s | ConvertTo-Json -Depth 10 | Set-Content $stateFile -Encoding UTF8
}

# Returns $true if UPN has been fully processed in a previous (saved) run
function Test-UserProcessed {
    param([object]$s, [string]$Upn)
    return ($s.processedUsers -contains $Upn)
}

# Returns the list of already-exported file names for a user key
function Get-ExportedList {
    param([object]$s, [string]$Key)
    $prop = $s.exportedFiles.PSObject.Properties[$Key]
    if ($prop) { return @($prop.Value) }
    return @()
}

# Records a successfully exported file in state
function Add-ExportedFile {
    param([object]$s, [string]$Key, [string]$FileName)
    $existing = $s.exportedFiles.PSObject.Properties[$Key]
    if ($existing) {
        $s.exportedFiles.$Key += $FileName
    } else {
        $s.exportedFiles | Add-Member -NotePropertyName $Key -NotePropertyValue @($FileName) -Force
    }
}

#endregion

#region ── Graph connection ──────────────────────────────────────────────────────

function Connect-ToGraph {
    param([string[]]$Scopes)

    # When -Force is set, always disconnect first so a fresh token is obtained.
    # This ensures newly granted admin consent is picked up immediately.
    if ($Force) {
        try { Disconnect-MgGraph -ErrorAction SilentlyContinue } catch { }
    } else {
        try {
            $ctx = Get-MgContext
            if ($ctx) {
                $missing = @($Scopes | Where-Object { $_ -notin @($ctx.Scopes) })
                if ($missing.Count -eq 0) {
                    Write-Log "Already connected as $($ctx.Account)." 'SUCCESS'
                    return
                }
                Write-Log "Reconnecting - missing scopes: $($missing -join ', ')." 'WARNING' -AlwaysShow
                try { Disconnect-MgGraph -ErrorAction SilentlyContinue } catch { }
            }
        } catch { }
    }

    # USNat/USSec are air-gapped clouds where the SDK is pre-configured for the environment;
    # Connect-MgGraph -Environment only accepts Global/China/USGov/USGovDoD.
    $params = @{ Scopes = $Scopes; NoWelcome = $true }
    if ($script:mgEnvironment -notin @('USNat', 'USSec')) { $params.Environment = $script:mgEnvironment }
    if (-not [string]::IsNullOrWhiteSpace($TenantId)) { $params.TenantId = $TenantId }
    if (-not [string]::IsNullOrWhiteSpace($LoginAs)) {
        Write-Log "*** Sign in as: $LoginAs ***" 'WARNING' -AlwaysShow
        Write-Log "    If an account picker appears, select '$LoginAs'." 'WARNING' -AlwaysShow
        Write-Log "    If the wrong account is pre-selected, click 'Use another account'." 'WARNING' -AlwaysShow
    }

    Write-Log 'Connecting to Microsoft Graph...' 'INFO' -AlwaysShow
    Connect-MgGraph @params
    Write-Log "Connected as $((Get-MgContext).Account)." 'SUCCESS' -AlwaysShow
}

#endregion

#region ── Pre-flight validation ─────────────────────────────────────────────────

function Test-Preflight {
    param([string[]]$RequiredScopes)

    Write-Log 'Running pre-flight checks...' 'INFO' -AlwaysShow
    $ok = $true

    $ctx = Get-MgContext
    if (-not $ctx) {
        Write-Log '  Graph connection: NOT connected.' 'ERROR' -AlwaysShow
        return $false
    }
    Write-Log "  Graph connection : OK ($($ctx.Account))" 'SUCCESS'

    $missing = @($RequiredScopes | Where-Object { $_ -notin @($ctx.Scopes) })
    if ($missing.Count -gt 0) {
        Write-Log "  Permissions      : MISSING - $($missing -join ', ')" 'ERROR' -AlwaysShow
        Write-Log "  Grant consent in Entra ID -> App registrations -> Microsoft Graph PowerShell -> API permissions." 'ERROR' -AlwaysShow
        $ok = $false
    } else {
        Write-Log '  Permissions      : OK' 'SUCCESS'
    }

    try {
        $drv    = Get-Item $env:USERPROFILE
        $freeGB = [math]::Round($drv.PSDrive.Free / 1GB, 1)
        $lvl    = if ($freeGB -lt 1) { 'WARNING' } else { 'SUCCESS' }
        Write-Log "  Disk space       : ${freeGB} GB free" $lvl
    } catch { }

    if ($ok) { Write-Log 'Pre-flight passed.' 'SUCCESS' -AlwaysShow }
    return $ok
}

#endregion

#region ── User resolution ───────────────────────────────────────────────────────

function Resolve-SingleUser {
    param([string]$Identity)
    try {
        $uri = "$script:graphBaseUrl/v1.0/users/$Identity`?`$select=id,displayName,userPrincipalName"
        return Invoke-MgGraphRequest -Method GET -Uri $uri
    } catch {
        Write-Log "Could not resolve user '$Identity': $_" 'ERROR' -AlwaysShow
        throw
    }
}

function Get-UsersToProcess {
    # ── User mode ──
    if ($Mode -eq 'User') {
        try {
            $me = Invoke-MgGraphRequest -Method GET `
                -Uri "$script:graphBaseUrl/v1.0/me?`$select=id,displayName,userPrincipalName"
            Write-Log "Signed-in user: $($me.displayName) ($($me.userPrincipalName))" 'INFO' -AlwaysShow
            return @($me)
        } catch {
            Write-Log "Failed to retrieve signed-in user profile: $_" 'ERROR' -AlwaysShow
            throw
        }
    }

    # ── Admin mode - CSV file ──
    if (-not [string]::IsNullOrWhiteSpace($UserListCsv)) {
        Write-Log "Loading user list from CSV: $UserListCsv" 'INFO' -AlwaysShow
        $rows = Import-Csv -Path $UserListCsv
        if ($rows.Count -eq 0) {
            Write-Log 'CSV file is empty.' 'ERROR' -AlwaysShow; throw 'CSV file is empty.'
        }

        $colName = if ($rows[0].PSObject.Properties.Name -contains 'UserPrincipalName') {
            'UserPrincipalName'
        } else {
            $rows[0].PSObject.Properties.Name | Select-Object -First 1
        }

        $upns = @($rows.$colName | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
        Write-Log "Found $($upns.Count) UPN(s) in CSV." 'INFO' -AlwaysShow
        return Resolve-UpnArray -Upns $upns
    }

    # ── Admin mode - inline list ──
    if ($UserList.Count -gt 0) {
        Write-Log "Processing $($UserList.Count) user(s) from -UserList." 'INFO' -AlwaysShow
        return Resolve-UpnArray -Upns $UserList
    }

    # ── Admin mode - all tenant users ──
    Write-Log "Fetching all enabled users in tenant (max $MaxUsers)..." 'INFO' -AlwaysShow
    $collected = [System.Collections.Generic.List[object]]::new()
    $nextUri   = "$script:graphBaseUrl/v1.0/users?`$top=999&`$select=id,displayName,userPrincipalName&`$filter=accountEnabled eq true"

    try {
        do {
            $resp    = Invoke-MgGraphRequest -Method GET -Uri $nextUri
            foreach ($u in $resp.value) { $collected.Add($u) }
            $nextUri = if ($resp.PSObject.Properties['@odata.nextLink']) { $resp.'@odata.nextLink' } else { $null }
            if ($collected.Count -ge $MaxUsers) { break }
        } while ($nextUri)
    } catch {
        Write-Log "Failed to retrieve tenant users: $_" 'ERROR' -AlwaysShow
        throw
    }

    $result = $collected | Select-Object -First $MaxUsers
    Write-Log "Found $($collected.Count) user(s); processing $(@($result).Count)." 'INFO' -AlwaysShow
    return @($result)
}

function Resolve-UpnArray {
    param([string[]]$Upns)
    $out = [System.Collections.Generic.List[object]]::new()
    foreach ($upn in $Upns) {
        try {
            $uri  = "$script:graphBaseUrl/v1.0/users/$upn`?`$select=id,displayName,userPrincipalName"
            $user = Invoke-MgGraphRequest -Method GET -Uri $uri
            $out.Add($user)
        } catch {
            Write-Log "Could not resolve '$upn' - skipping: $_" 'WARNING'
        }
    }
    return $out.ToArray()
}

#endregion


#region ── Whiteboard discovery in OneDrive ──────────────────────────────────────

function Get-WhiteboardItems {
    # Returns an array of drive item objects (.whiteboard files) found anywhere inside
    # the Whiteboards folder and all its subfolders, or $null if the user has no
    # OneDrive / no Whiteboards folder / access denied.
    # Each returned item has a '_driveId' property for use in Export-OneWhiteboard.
    param(
        [string]$UserObjectId,
        [string]$DisplayLabel     # used only for log messages
    )

    $allFiles    = [System.Collections.Generic.List[object]]::new()
    $folderQueue = [System.Collections.Generic.Queue[string]]::new()

    # ── Seed: Whiteboards root via direct path (avoids drive-root 403) ──────────
    # Any error here means the user has no OneDrive or no access — return $null.
    try {
        $nextUri = "$script:graphBaseUrl/v1.0/users/$UserObjectId/drive/root:/Whiteboards:/children"
        do {
            $resp = Invoke-MgGraphRequest -Method GET -Uri $nextUri
            foreach ($item in $resp.value) {
                if ($item.folder) {
                    Write-Log "  Found subfolder: $($item.name) — queuing for enumeration." 'DEBUG'
                    $folderQueue.Enqueue("$script:graphBaseUrl/v1.0/users/$UserObjectId/drive/items/$($item.id)/children")
                } else {
                    $allFiles.Add($item)
                }
            }
            $nextUri = if ($resp.'@odata.nextLink') { $resp.'@odata.nextLink' } else { $null }
        } while ($nextUri)
    } catch {
        $errMsg  = $_.Exception.Message
        $errBody = if ($_.ErrorDetails.Message) { $_.ErrorDetails.Message } else { '' }
        if ($errMsg -match 'itemNotFound|Not Found' -or $errBody -match 'itemNotFound') {
            Write-Log "  No Whiteboards folder / no OneDrive for $DisplayLabel - skipping." 'WARNING'
        } elseif ($errMsg -match 'accessDenied|Access denied|Forbidden' -or $errBody -match 'accessDenied') {
            Write-Log "  Access denied to Whiteboards for $DisplayLabel - skipping." 'WARNING'
        } else {
            $detail = if ($errBody) { "$errMsg | $errBody" } else { $errMsg }
            Write-Log "  Could not list Whiteboards for $DisplayLabel - skipping. Error: $detail" 'WARNING'
        }
        return $null
    }

    # ── Recurse into subfolders ──────────────────────────────────────────────────
    # Errors on individual subfolders are non-fatal — log and continue.
    while ($folderQueue.Count -gt 0) {
        $folderUri = $folderQueue.Dequeue()
        try {
            $nextUri = $folderUri
            do {
                $resp = Invoke-MgGraphRequest -Method GET -Uri $nextUri
                foreach ($item in $resp.value) {
                    if ($item.folder) {
                        Write-Log "  Found nested subfolder: $($item.name) — queuing for enumeration." 'DEBUG'
                        $folderQueue.Enqueue("$script:graphBaseUrl/v1.0/users/$UserObjectId/drive/items/$($item.id)/children")
                    } else {
                        $allFiles.Add($item)
                    }
                }
                $nextUri = if ($resp.'@odata.nextLink') { $resp.'@odata.nextLink' } else { $null }
            } while ($nextUri)
        } catch {
            Write-Log "  Could not enumerate subfolder for $DisplayLabel - skipping it. Error: $($_.Exception.Message)" 'WARNING'
        }
    }

    # Stamp each item with its drive ID (from parentReference) for use in export.
    $wbFiles = @($allFiles | Where-Object { ($_.name -like '*.whiteboard' -or $_.name -like '*.wbtx') -and -not $_.folder })
    foreach ($f in $wbFiles) {
        $driveId = if ($f.parentReference -and $f.parentReference.driveId) { $f.parentReference.driveId } else { $null }
        $f | Add-Member -NotePropertyName '_driveId' -NotePropertyValue $driveId -Force
    }
    return $wbFiles
}

#endregion

#region ── Single whiteboard HTML export ─────────────────────────────────────────

function Export-OneWhiteboard {
    # Returns: 'success' | 'skipped' | 'failed'
    param(
        [string]$UserObjectId,
        [string]$UserUpn,
        [object]$Item,
        [string]$OutDir,
        [object]$State,
        [string]$StateKey    # key into state.exportedFiles
    )

    $baseName  = [System.IO.Path]::GetFileNameWithoutExtension($Item.name)
    $safeBase  = $baseName -replace '[\\/:*?"<>|]', '_'
    $htmlFile  = Join-Path $OutDir "$safeBase.html"

    # Skip if already exported (resume mode)
    $doneList = Get-ExportedList -s $State -Key $StateKey
    if ($doneList -contains $Item.name) {
        Write-Log "    [SKIP] Already exported: $($Item.name)" 'DEBUG'
        return 'skipped'
    }

    # Skip if previously failed — run Invoke-WhiteboardHtmlRetry to retry
    $prevFail = @($State.failedExports) | Where-Object {
        $_.user -eq $UserUpn -and $_.file -eq $Item.name
    }
    if ($prevFail) {
        Write-Log "    [SKIP] Previously failed (run Invoke-WhiteboardHtmlRetry to retry): $($Item.name)" 'WARNING'
        return 'skipped'
    }

    Write-Log "    Exporting: $($Item.name)..." 'INFO'

    # Prefer drive-ID-based URI (works for both user-based and site-based access).
    $uri = if ($Item._driveId) {
        "$script:graphBaseUrl/v1.0/drives/$($Item._driveId)/items/$($Item.id)/content?format=html"
    } else {
        "$script:graphBaseUrl/v1.0/users/$UserObjectId/drive/items/$($Item.id)/content?format=html"
    }
    $maxTries = 4

    for ($attempt = 1; $attempt -le $maxTries; $attempt++) {
        try {
            Invoke-MgGraphRequest -Method GET -Uri $uri -OutputFilePath $htmlFile
            Write-Log "    [OK] $safeBase.html" 'SUCCESS'
            $State.stats.successfulExports++
            Add-ExportedFile -s $State -Key $StateKey -FileName $Item.name
            Save-State $State
            return 'success'
        } catch {
            if ($attempt -lt $maxTries) {
                Write-Log "    Attempt $attempt failed - retrying in 3 s... ($_)" 'WARNING'
                Start-Sleep -Seconds 3
            } else {
                Write-Log "    [FAIL] $($Item.name) after $maxTries attempts (3 retries): $_" 'ERROR'
                $State.stats.failedExports++

                # Remove stale failure record before adding fresh one
                $State.failedExports = @($State.failedExports | Where-Object {
                    -not ($_.user -eq $UserUpn -and $_.file -eq $Item.name)
                })
                $State.failedExports += [PSCustomObject]@{
                    user      = $UserUpn
                    file      = $Item.name
                    itemId    = $Item.id
                    error     = $_.ToString()
                    timestamp = (Get-Date -Format 'o')
                }
                Save-State $State
                return 'failed'
            }
        }
    }
}

#endregion

#region ── Per-user export orchestration ─────────────────────────────────────────

function Invoke-UserExport {
    param(
        [object]$User,
        [object]$State,
        [string]$UserOutDir,
        [string]$StateKey,       # key for state.exportedFiles
        [datetime]$RunStart
    )

    $userId  = $User.id
    $upn     = $User.userPrincipalName
    $display = $User.displayName

    Write-Log "Processing: $display ($upn)" 'INFO'
    $State.stats.usersProcessed++

    if ($ThrottleDelayMs -gt 0) { Start-Sleep -Milliseconds $ThrottleDelayMs }

    $wbItems = Get-WhiteboardItems -UserObjectId $userId -DisplayLabel "$display ($upn)"

    if ($null -eq $wbItems) {
        $State.stats.usersNoOneDrive++
        return
    }

    if ($wbItems.Count -eq 0) {
        Write-Log "  No .whiteboard files found for $upn." 'WARNING'
        $State.stats.usersNoWhiteboards++
        return
    }

    Write-Log "  Found $($wbItems.Count) whiteboard(s)." 'SUCCESS'
    $State.stats.usersWithWhiteboards++
    $State.stats.totalWhiteboards += $wbItems.Count

    New-Item -ItemType Directory -Path $UserOutDir -Force | Out-Null

    $wbIdx = 0
    foreach ($item in $wbItems) {
        $wbIdx++
        Show-Progress `
            -Current    $wbIdx `
            -Total      $wbItems.Count `
            -Activity   "Whiteboards for: $upn" `
            -Status     "$($item.name)" `
            -StartTime  $RunStart `
            -Id         1 `
            -ParentId   0

        Export-OneWhiteboard `
            -UserObjectId $userId `
            -UserUpn      $upn `
            -Item         $item `
            -OutDir       $UserOutDir `
            -State        $State `
            -StateKey     $StateKey | Out-Null

        if ($ThrottleDelayMs -gt 0) { Start-Sleep -Milliseconds $ThrottleDelayMs }
    }

    Write-Progress -Id 1 -Activity "Whiteboards for: $upn" -Completed
}

#endregion

#region ── Final summary ─────────────────────────────────────────────────────────

function Write-FinalSummary {
    param([object]$State, [TimeSpan]$Duration)

    $durStr = '{0:D2}h {1:D2}m {2:D2}s' -f $Duration.Hours, $Duration.Minutes, $Duration.Seconds

    $summaryObj = [ordered]@{
        mode             = $State.mode
        tenantId         = $State.tenantId
        exportCompletedAt = (Get-Date -Format 'o')
        duration         = $durStr
        durationSeconds  = [int]$Duration.TotalSeconds
        statistics       = $State.stats
        failures         = @($State.failedExports)
        outputFolder     = $baseOutDir
    }
    $summaryObj | ConvertTo-Json -Depth 10 | Set-Content $summaryFile -Encoding UTF8

    $failColor = if ($State.stats.failedExports -gt 0) { 'Red' } else { 'Green' }

    Write-Host ''
    Write-Host '============================================' -ForegroundColor Cyan
    Write-Host '       WHITEBOARD EXPORT - SUMMARY'         -ForegroundColor Cyan
    Write-Host '============================================' -ForegroundColor Cyan
    Write-Host "Mode             : $($State.mode)"
    if ($State.tenantId) {
        Write-Host "Tenant           : $($State.tenantId)"
    }
    Write-Host "Duration         : $durStr"
    Write-Host '--------------------------------------------'
    Write-Host "Users processed  : $($State.stats.usersProcessed)"
    Write-Host "With whiteboards : $($State.stats.usersWithWhiteboards)"
    Write-Host "No OneDrive      : $($State.stats.usersNoOneDrive)"
    Write-Host "No whiteboards   : $($State.stats.usersNoWhiteboards)"
    Write-Host '--------------------------------------------'
    Write-Host "Total found      : $($State.stats.totalWhiteboards)"
    Write-Host "Exported (OK)    : $($State.stats.successfulExports)" -ForegroundColor Green
    Write-Host "Failed           : $($State.stats.failedExports)"     -ForegroundColor $failColor
    Write-Host '--------------------------------------------'
    Write-Host "Output folder    : $baseOutDir"  -ForegroundColor Green
    Write-Host "Log file         : $($script:logFile)"
    Write-Host "Summary JSON     : $summaryFile"
    Write-Host '============================================' -ForegroundColor Cyan

    if ($State.stats.failedExports -gt 0) {
        Write-Host ''
        Write-Host 'Tip: Run Invoke-WhiteboardHtmlRetry to retry failed exports.' -ForegroundColor Yellow
        Write-Host '     Check export_log.txt for per-failure details.'           -ForegroundColor Yellow
    }
}

#endregion

# ═════════════════════════════════════════════════════════════════════════════════
#  MAIN
# ═════════════════════════════════════════════════════════════════════════════════

Write-Host ''
Write-Host '╔══════════════════════════════════════════════╗' -ForegroundColor Cyan
Write-Host '║   Microsoft Whiteboard HTML Exporter         ║' -ForegroundColor Cyan
Write-Host "║   Mode : $($Mode.PadRight(36))║" -ForegroundColor Cyan
if ($TenantId) {
    Write-Host "║   Tenant: $($TenantId.PadRight(35))║" -ForegroundColor Cyan
}
Write-Host '╚══════════════════════════════════════════════╝' -ForegroundColor Cyan
Write-Host ''

# ── 1. Required Graph scopes ────────────────────────────────────────────────
$requiredScopes = if ($Mode -eq 'User') {
    @('User.Read', 'Files.Read')
} else {
    @('User.Read.All', 'Files.Read.All', 'Sites.Read.All')
}

# ── 2. Connect ──────────────────────────────────────────────────────────────
Connect-ToGraph -Scopes $requiredScopes

# ── 3. Pre-flight ───────────────────────────────────────────────────────────
if (-not (Test-Preflight -RequiredScopes $requiredScopes)) {
    Write-Log 'Pre-flight failed. Exiting.' 'ERROR' -AlwaysShow
    throw 'Export-WhiteboardHtml: pre-flight checks failed.'
}
Write-Host ''

# ── 5. Load or create run state ─────────────────────────────────────────────
$state = Get-SavedState
if ($state) {
    $resumed = $true
    Write-Log "Resuming - $(@($state.processedUsers).Count) user(s) already processed." 'INFO' -AlwaysShow
} else {
    $resumed = $false
    $state   = New-RunState
    Write-Log 'Starting new export.' 'INFO' -AlwaysShow
}

$runStart = Get-Date

# ── 6. Resolve the list of users ────────────────────────────────────────────
$users                    = @(Get-UsersToProcess)
$state.stats.totalUsers   = $users.Count
Write-Log "Users to process: $($users.Count)" 'INFO' -AlwaysShow
Write-Host ''

if ($users.Count -eq 0) {
    Write-Log 'No users to process. Exiting.' 'WARNING' -AlwaysShow
    return
}

# ── 7. Main loop ─────────────────────────────────────────────────────────────
$userIdx = 0
foreach ($user in $users) {
    $userIdx++
    $upn = $user.userPrincipalName

    # Top-level progress bar (users)
    Show-Progress `
        -Current   $userIdx `
        -Total     $users.Count `
        -Activity  "Whiteboard Export [$Mode]" `
        -Status    "User: $upn" `
        -StartTime $runStart `
        -Id        0

    # Skip users fully processed in a prior run
    if ($resumed -and (Test-UserProcessed -s $state -Upn $upn)) {
        Write-Log "  [SKIP] Already fully processed: $upn" 'DEBUG'
        continue
    }

    Write-Host "[$userIdx/$($users.Count)] " -NoNewline -ForegroundColor DarkGray
    Write-Host $upn -ForegroundColor White

    # Per-user output folder and state key
    if ($Mode -eq 'User') {
        $userOutDir = $baseOutDir                          # flat: all HTMLs in base folder
        $stateKey   = $upn
    } else {
        $safeUpn    = $upn -replace '[\\/:*?"<>|]', '_'
        $userOutDir = Join-Path $baseOutDir $safeUpn
        $stateKey   = $upn
    }

    Invoke-UserExport `
        -User       $user `
        -State      $state `
        -UserOutDir $userOutDir `
        -StateKey   $stateKey `
        -RunStart   $runStart

    # Mark user as fully processed for this run
    $state.processedUsers += $upn
    Save-State $state
}

# ── 8. Finish ────────────────────────────────────────────────────────────────
Write-Progress -Id 0 -Activity "Whiteboard Export [$Mode]" -Completed

$state.status      = 'completed'
$state.completedAt = (Get-Date -Format 'o')
Save-State $state

$duration = (Get-Date) - $runStart
Write-Log "Export complete. Duration: $("{0:D2}h {1:D2}m {2:D2}s" -f $duration.Hours, $duration.Minutes, $duration.Seconds)" `
    'SUCCESS' -AlwaysShow

Write-FinalSummary -State $state -Duration $duration
} # end function Export-WhiteboardHtml
