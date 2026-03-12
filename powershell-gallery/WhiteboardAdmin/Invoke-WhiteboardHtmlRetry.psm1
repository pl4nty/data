<#
.SYNOPSIS
    Retries failed whiteboard HTML exports from a previous Export-WhiteboardHtml run.

.DESCRIPTION
    Reads the export_state.json produced by Export-WhiteboardHtml, identifies all failed
    exports, and re-attempts each one. On success the item is removed from the failures
    list and recorded in exportedFiles. The state file is updated in place.

    The output folder is derived automatically from -Mode, -TenantId, and -OutputPath —
    the same way Export-WhiteboardHtml resolves it, so no -StateFile path is needed.

.PARAMETER Mode
    Required. Must match the mode used in the original Export-WhiteboardHtml run:
    'User' or 'Admin'.

.PARAMETER Environment
    Required. Must match the environment used in the original Export-WhiteboardHtml run.
    AzureCloud        - Public / GCC (graph.microsoft.com)
    AzureUSGovernment - GCC-High (graph.microsoft.us)
    AzureUSDoD        - DoD (dod-graph.microsoft.us)
    AzureUSNat        - Air-Gap / USNat (graph.eaglex.ic.gov)
    AzureUSSec        - Air-Gap / USSec (graph.microsoft.scloud)

.PARAMETER TenantId
    Required in Admin mode. Must match the TenantId used in the original run.

.PARAMETER OutputPath
    Base directory for the output folder. Must match -OutputPath from the original run.
    Defaults to the user's Downloads folder.

.PARAMETER LoginAs
    Optional. UPN hint shown before the browser sign-in prompt.

.PARAMETER ThrottleDelayMs
    Milliseconds to pause between Graph API calls. Default: 100.

.EXAMPLE
    # Retry failed exports from an Admin run
    Invoke-WhiteboardHtmlRetry -Mode Admin -TenantId contoso.onmicrosoft.com -Environment AzureCloud

.EXAMPLE
    # Retry failed exports from a User run
    Invoke-WhiteboardHtmlRetry -Mode User -Environment AzureCloud

.EXAMPLE
    # Retry with a custom output path (must match the original Export-WhiteboardHtml run)
    Invoke-WhiteboardHtmlRetry -Mode Admin -TenantId contoso.onmicrosoft.com -Environment AzureCloud `
        -OutputPath C:\Exports
#>

function Invoke-WhiteboardHtmlRetry {
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('User', 'Admin')]
    [string]$Mode,

    [Parameter(Mandatory = $true)]
    [ValidateSet('AzureCloud', 'AzureUSGovernment', 'AzureUSDoD', 'AzureUSNat', 'AzureUSSec')]
    [string]$Environment,

    [Parameter(Mandatory = $false)]
    [string]$TenantId,

    [Parameter(Mandatory = $false)]
    [string]$OutputPath,

    [Parameter(Mandatory = $false)]
    [string]$LoginAs,

    [Parameter(Mandatory = $false)]
    [int]$ThrottleDelayMs = 100
)

$ErrorActionPreference = 'Stop'

#region ── Parameter validation ──────────────────────────────────────────────────

if ($Mode -eq 'Admin' -and [string]::IsNullOrWhiteSpace($TenantId)) {
    Write-Error "Admin mode requires -TenantId. Example: -TenantId contoso.onmicrosoft.com"
}

#endregion

#region ── Resolve output folder and state file (mirrors Export-WhiteboardHtml) ──

$downloadsRoot = if ($OutputPath) { $OutputPath } else { Join-Path $env:USERPROFILE 'Downloads' }

$baseOutDir = if ($Mode -eq 'User') {
    Join-Path $downloadsRoot 'WhiteboardExports'
} else {
    Join-Path $downloadsRoot "WhiteboardExports_$TenantId"
}

$stateFile = Join-Path $baseOutDir 'export_state.json'
$logFile   = Join-Path $baseOutDir 'export_log.txt'

#endregion

#region ── Load and validate state file ──────────────────────────────────────────

if (-not (Test-Path $stateFile)) {
    Write-Error "State file not found: $stateFile`nRun Export-WhiteboardHtml first."
}

try {
    $state = Get-Content $stateFile -Raw | ConvertFrom-Json
} catch {
    Write-Error "Could not parse state file: $_"
}

$failed = @($state.failedExports)

if ($failed.Count -eq 0) {
    Write-Host 'No failed exports in state file. Nothing to retry.' -ForegroundColor Green
    return
}

#endregion

#region ── Environment mapping ───────────────────────────────────────────────────

$graphBaseUrl  = switch ($Environment) {
    'AzureUSGovernment' { 'https://graph.microsoft.us'         }
    'AzureUSDoD'        { 'https://dod-graph.microsoft.us'     }
    'AzureUSNat'        { 'https://graph.eaglex.ic.gov'        }
    'AzureUSSec'        { 'https://graph.microsoft.scloud'     }
    default             { 'https://graph.microsoft.com'        }
}
$mgEnvironment = switch ($Environment) {
    'AzureUSGovernment' { 'USGov'    }
    'AzureUSDoD'        { 'USGovDoD' }
    'AzureUSNat'        { 'USNat'    }
    'AzureUSSec'        { 'USSec'    }
    default             { 'Global'   }
}

#endregion

#region ── Logging ────────────────────────────────────────────────────────────────

function Write-Log {
    param(
        [string]$Message,
        [ValidateSet('INFO', 'SUCCESS', 'WARNING', 'ERROR')]
        [string]$Level = 'INFO'
    )
    $ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    Add-Content -Path $logFile -Value "[$ts] [$Level] $Message" -Encoding UTF8

    $color = switch ($Level) {
        'SUCCESS' { 'Green'  }
        'WARNING' { 'Yellow' }
        'ERROR'   { 'Red'    }
        default   { 'White'  }
    }
    Write-Host $Message -ForegroundColor $color
}

#endregion

#region ── Graph connection ───────────────────────────────────────────────────────

$scopes = if ($Mode -eq 'User') {
    @('User.Read', 'Files.Read')
} else {
    @('User.Read.All', 'Files.Read.All', 'Sites.Read.All')
}

try {
    $ctx = Get-MgContext
    if ($ctx) {
        $missing = @($scopes | Where-Object { $_ -notin @($ctx.Scopes) })
        if ($missing.Count -eq 0) {
            Write-Log "Already connected as $($ctx.Account)." 'SUCCESS'
        } else {
            Write-Log "Reconnecting - missing scopes: $($missing -join ', ')." 'WARNING'
            try { Disconnect-MgGraph -ErrorAction SilentlyContinue } catch { }
        }
    }
} catch { }

if (-not (Get-MgContext)) {
    $connectParams = @{ Scopes = $scopes; NoWelcome = $true }
    if ($mgEnvironment -notin @('USNat', 'USSec')) { $connectParams.Environment = $mgEnvironment }
    if (-not [string]::IsNullOrWhiteSpace($TenantId)) { $connectParams.TenantId = $TenantId }
    if (-not [string]::IsNullOrWhiteSpace($LoginAs)) {
        Write-Log "*** Sign in as: $LoginAs ***" 'WARNING'
        Write-Log "    If an account picker appears, select '$LoginAs'." 'WARNING'
        Write-Log "    If the wrong account is pre-selected, click 'Use another account'." 'WARNING'
    }
    Write-Log 'Connecting to Microsoft Graph...' 'INFO'
    Connect-MgGraph @connectParams
    Write-Log "Connected as $((Get-MgContext).Account)." 'SUCCESS'
}

#endregion

#region ── UPN → Object ID resolution ────────────────────────────────────────────

$userIdCache = @{}

function Resolve-UserObjectId {
    param([string]$Upn)
    if ($userIdCache.ContainsKey($Upn)) { return $userIdCache[$Upn] }
    try {
        $uri  = "$graphBaseUrl/v1.0/users/$Upn`?`$select=id"
        $user = Invoke-MgGraphRequest -Method GET -Uri $uri
        $userIdCache[$Upn] = $user.id
        return $user.id
    } catch {
        Write-Log "Could not resolve user '$Upn': $_" 'ERROR'
        return $null
    }
}

#endregion

#region ── Retry loop ─────────────────────────────────────────────────────────────

Write-Host ''
Write-Host '============================================' -ForegroundColor Cyan
Write-Host "  Retrying $($failed.Count) failed export(s)" -ForegroundColor Cyan
Write-Host "  Mode   : $Mode"                             -ForegroundColor Cyan
if ($TenantId) {
    Write-Host "  Tenant : $TenantId"                     -ForegroundColor Cyan
}
Write-Host '============================================' -ForegroundColor Cyan
Write-Host ''

$successCount = 0
$stillFailed  = [System.Collections.Generic.List[object]]::new()
$maxTries     = 4

$idx = 0
foreach ($entry in $failed) {
    $idx++
    Write-Log "[$idx/$($failed.Count)] $($entry.user) / $($entry.file)" 'INFO'

    $userId = Resolve-UserObjectId -Upn $entry.user
    if (-not $userId) {
        $stillFailed.Add($entry)
        continue
    }

    # Reconstruct output directory (mirrors Export-WhiteboardHtml logic)
    if ($Mode -eq 'User') {
        $outDir = $baseOutDir
    } else {
        $safeUpn = $entry.user -replace '[\\/:*?"<>|]', '_'
        $outDir  = Join-Path $baseOutDir $safeUpn
    }
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null

    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($entry.file)
    $safeBase = $baseName -replace '[\\/:*?"<>|]', '_'
    $htmlFile = Join-Path $outDir "$safeBase.html"
    $uri      = "$graphBaseUrl/v1.0/users/$userId/drive/items/$($entry.itemId)/content?format=html"
    $ok       = $false

    for ($attempt = 1; $attempt -le $maxTries; $attempt++) {
        try {
            Invoke-MgGraphRequest -Method GET -Uri $uri -OutputFilePath $htmlFile
            Write-Log "  [OK] $safeBase.html" 'SUCCESS'
            $ok = $true
            $successCount++

            # Record as exported in state and remove from failures list
            $key  = $entry.user
            $prop = $state.exportedFiles.PSObject.Properties[$key]
            if ($prop) {
                $state.exportedFiles.$key += $entry.file
            } else {
                $state.exportedFiles | Add-Member -NotePropertyName $key -NotePropertyValue @($entry.file) -Force
            }
            break
        } catch {
            if ($attempt -lt $maxTries) {
                Write-Log "  Attempt $attempt failed - retrying in 3 s... ($_)" 'WARNING'
                Start-Sleep -Seconds 3
            } else {
                Write-Log "  [FAIL] $($entry.file) after $maxTries attempts: $_" 'ERROR'
                $stillFailed.Add([PSCustomObject]@{
                    user      = $entry.user
                    file      = $entry.file
                    itemId    = $entry.itemId
                    error     = $_.ToString()
                    timestamp = (Get-Date -Format 'o')
                })
            }
        }
    }

    if ($ThrottleDelayMs -gt 0) { Start-Sleep -Milliseconds $ThrottleDelayMs }
}

#endregion

#region ── Update state and summary files ────────────────────────────────────────

$state.failedExports           = $stillFailed.ToArray()
$state.stats.successfulExports = $state.stats.successfulExports + $successCount
$state.stats.failedExports     = $stillFailed.Count
$state.lastUpdatedAt           = (Get-Date -Format 'o')
if ($stillFailed.Count -eq 0) { $state.status = 'completed' }

$state | ConvertTo-Json -Depth 10 | Set-Content $stateFile -Encoding UTF8
Write-Log "State file updated: $stateFile" 'INFO'

$summaryFile = Join-Path $baseOutDir 'export_summary.json'
$summaryObj  = [ordered]@{
    mode              = $Mode
    tenantId          = $TenantId
    exportCompletedAt = (Get-Date -Format 'o')
    statistics        = $state.stats
    failures          = @($state.failedExports)
    outputFolder      = $baseOutDir
}
$summaryObj | ConvertTo-Json -Depth 10 | Set-Content $summaryFile -Encoding UTF8
Write-Log "Summary file updated: $summaryFile" 'INFO'

#endregion

#region ── Summary ────────────────────────────────────────────────────────────────

$failColor = if ($stillFailed.Count -gt 0) { 'Red' } else { 'Green' }

Write-Host ''
Write-Host '============================================' -ForegroundColor Cyan
Write-Host '       WHITEBOARD RETRY - SUMMARY'          -ForegroundColor Cyan
Write-Host '============================================' -ForegroundColor Cyan
Write-Host "Retried      : $($failed.Count)"
Write-Host "Succeeded    : $successCount"              -ForegroundColor Green
Write-Host "Still failed : $($stillFailed.Count)"      -ForegroundColor $failColor
Write-Host '--------------------------------------------'
Write-Host "Output folder: $baseOutDir"                -ForegroundColor Green
Write-Host "State file   : $stateFile"
Write-Host '============================================' -ForegroundColor Cyan

#endregion

} # end function Invoke-WhiteboardHtmlRetry
