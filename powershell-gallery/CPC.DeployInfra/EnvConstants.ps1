
function Get-Ev2Env {
    param ([string]$Env)

    return $global:envConstants.$Env.ev2Env
}

function Get-SubscriptionId {
    param ([string]$Env)

    return $global:envConstants.$Env.subscriptionId
}

function Get-AadTenantId {
    param ([string]$Env)

    return $global:envConstants.$Env.aadTenantId
}

function Get-Ev2ShellIdentityObjectId {
    param ([string]$Env)

    return $global:envConstants.$Env.ev2ShellIdentityObjectId
}

function Get-AntaresObjectId {
    param ([string]$Env)

    return $global:envConstants.$Env.antaresObjectId
}

function Get-Ev2ObjectId {
    param ([string]$Env)

    return $global:envConstants.$Env.ev2ObjectId
}

function Get-DefaultKeyExpireInMonths {
    # expires in 12 months
    return 12
}

function Get-DefaultKeyRotateInDays {
    # rotate every 90 days
    return 90
}

function Get-DefaultCertValidityInMonths {
    param ([string]$Env)

    if ((Get-Ev2Env -Env $Env) -eq "Test") {
        return 6
    }
    else {
        return 12
    }
}

function Get-DefaultCertRenewalPercentage {
    param ([string]$Env)

    if ((Get-Ev2Env -Env $Env) -eq "Test") {
        return 40
    }
    else {
        return 20
    }
}

$storageName = "cpcsasharedtools"
$blobSuffix = ".blob.core.windows.net"
$envConstantsUrl = "https://" + $storageName + $blobSuffix + "/config/EnvConstants.json"
$dest = "$PSScriptRoot\EnvConstants.json"
Invoke-WebRequest -Uri $envConstantsUrl -OutFile $dest
$global:envConstants = Get-Content $dest -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop
