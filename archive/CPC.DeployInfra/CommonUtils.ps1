
function Install-AzModules {
    if (-not (Get-Module -ListAvailable -Name Az)) {
        Install-Module Az -Scope CurrentUser
        Install-Module Az.ManagedServiceIdentity -Scope CurrentUser
    }
}

function Get-EV2Cmdlets {
    $moduleName = "Microsoft.Azure.Deployment.Express.Client"
    $directoryName = "Microsoft/AzureServiceDeployClient";
    $modulePath = Join-Path -Path $env:LOCALAPPDATA -ChildPath $directoryName

    if (-not (Test-Path -Path $modulePath)) {
        Write-Host "ERROR: Missing EV2 commands"
        throw "Missing EV2 commands"
    }

    $ev2Cmdlet = Get-ChildItem -Path $modulePath -Recurse -Include "$($moduleName).dll" -ErrorAction SilentlyContinue | Sort-Object LastWriteTime | Select-Object -Last 1
    if (!$ev2Cmdlet) {
        Write-Host "ERROR: Missing EV2 commands"
        throw "Missing EV2 commands"
    }

    Write-Host "Using EV2 cmdlets from $($ev2Cmdlet.FullName)"

    if (!(Get-Module $moduleName)) {
        Import-Module $ev2Cmdlet.FullName
    }
}

function Enter-ExceptionHandler($name, $exception) {
    Write-Host "EXCEPTION CAUGHT IN $name"
    Write-Error -Exception $exception -Message $exception.Message
    throw "EXCEPTION CAUGHT IN $name"
}

function Test-ServiceRollout($ServiceGroupRoot, $RolloutSpec) {
    try {
        Test-AzureServiceRollout -ServiceGroupRoot $ServiceGroupRoot -RolloutSpec $RolloutSpec -ClientMode -EnableStrictValidation
        Write-Host -ForegroundColor Green "$RolloutSpec is valid"
    }
    catch {
        Write-Host -ForegroundColor Red "$RolloutSpec is invalid, please check!"
        throw "$RolloutSpec is invalid, please check!"
    }
}

function New-ServiceRollout($ServiceGroupRoot, $RolloutSpec) {
    New-AzureServiceRollout -ServiceGroupRoot $ServiceGroupRoot -RolloutSpec $RolloutSpec -RolloutInfra "Test" -Verbose -WaitToComplete
}

function New-Ev2Deploy {
    param (
        [string]$ServiceGroupRoot,
        [string]$RolloutName,
        [string]$Env,
        [string]$Stamp,
        [bool]$IsService = $true,
        [switch]$WhatIf
    )
    Get-EV2Cmdlets

    # Rollout file names of service & infrastructure are different
    if ($IsService) {
        $Env = $Env.ToUpper()
        $Stamp = $Stamp.ToUpper()
        $RolloutName = $RolloutName + "Spec"
        $rolloutSpec = "Rollout.$Env.$Stamp.$RolloutName.json"
    }
    else {
        $rolloutSpec = "RolloutSpec.$RolloutName.$Env.$Stamp.json"
    }

    # Support both relative and absolute path
    if ([System.IO.Path]::IsPathRooted($ServiceGroupRoot)) {
        # Write-Host "It's an absolute path"
    } else {
        $ServiceGroupRoot = Resolve-Path -Path $ServiceGroupRoot
        # Write-Host "It's a relative path, corresponding absolute path is $ServiceGroupRoot"
    }

    Test-ServiceRollout $ServiceGroupRoot $rolloutSpec

    if (!$WhatIf) {
        New-ServiceRollout $ServiceGroupRoot $rolloutSpec
    }
}

################################################################################
$global:emailBody = ""

function Write-Email-Log {
    param (
        [string]$Message
    )
    Write-Host $Message

    $line = Write-Verbose -Verbose $Message 4>&1
    $global:emailBody += "<p>" + $line + "</p>"
}

function Send-Log-Email() {
    param (
        [string]$LogicAppEndpoint,
        [string]$KeyVaultName,
        [string]$EmailSubject,
        [string]$RecipientEmailAddress,
        [string]$CcEmailAddress = ""
    )
    $logicAppKey = Get-AzKeyVaultSecret -VaultName $KeyVaultName -Name "logic-app-key" -AsPlainText -ErrorAction Stop
    $postUri = $LogicAppEndpoint + $logicAppKey

    $header = @{
        "Accept" = "application/json;api-version=6.0;excludeUrls=true";
        "Content-Type" = "application/json"
    }

    $body = [PsCustomObject]@{
        "emailSubject" = "[Deployment Log] " + $EmailSubject;
        "recipientEmailAddress" = $RecipientEmailAddress;
        "ccEmailAddress" = $CcEmailAddress;
        "emailBody" = "$global:emailBody";
    }

    Invoke-RestMethod -Method Post -Uri $postUri -Headers $header -Body (ConvertTo-Json $body)

    Write-Host "Sent out email succeeded"
}
