function Import-AppConfiguration {
    param (
        [string]$ConfigSettingPath,
        [string]$SvcName,
        [ValidateSet('service', 'shared')]
        [string]$ConfigScope,
        [string]$Env,
        [string]$Stamp,
        [ValidateSet('public', 'fairfax')]
        [string]$Cloud,
        [string]$AacPrimaryName,
        [string]$AacFailoverName,
        [bool]$IsPrimary = $false,
        [bool]$IsCommonSvc = $false
    )

    function Get-PrimaryStampName {
        param (
            [string]$FailoverOrPrimaryStampName
        )

        $stampNames = @{
            'self1s' = 'self01'
            'sh01s' = 'sh01'
            'prap1s' = 'prap01'
            'prau1s' = 'prau01'
            'preu1s' = 'preu01'
            'preu2s' = 'preu02'
            'prna1s' = 'prna01'
            'prna2s' = 'prna02'
            'ghb1s' = 'ghb01'
            'gcp1s' = 'gcp01'
            'ghp1s' = 'ghp01'
        }

        if ($stampNames.ContainsKey($FailoverOrPrimaryStampName)) {
            return $stampNames[$FailoverOrPrimaryStampName]
        } else {
            return $FailoverOrPrimaryStampName
        }
    }

    function Import-ConfigFile {
        param (
            [string]$FileName,
            [string]$AacName,
            [string]$FilePath,
            [string]$ConfigPrefix,
            [string]$ConfigScope,
            [bool]$DryRun = $false
        )


        $importedFileName = "$ConfigPrefix-$FileName-$AacName"

        if ($importedFiles.ContainsKey($importedFileName)) {
            $importedFilePath = $importedFiles[$importedFileName]
            Write-Host "Have picked $importedFilePath, skip $FilePath" -ForegroundColor Yellow
            return
        }

        if ($DryRun -eq $false) {
            Write-Host "Will import $FileName to $AacName"
            az appconfig kv import -n $AacName -s file --path $FilePath --prefix $ConfigPrefix --format json --separator : --content-type application/json --yes

            # azure cli doesn't create exceptions for powershell to catch, use $? to check the most recent command execution status
            # https://learn.microsoft.com/en-us/cli/azure/use-cli-effectively?tabs=bash%2Cbash2#error-handling-for-azure-cli-in-powershell
            if ($? -eq $false) {
                Write-Host "Failed to import $FileName to $AacName as application/json content type, try with the default content type" -ForegroundColor Red
                az appconfig kv import -n $AacName -s file --path $FilePath --prefix $ConfigPrefix --format json --separator : --yes
                if ($? -eq $false) {
                    Write-Host "Failed to import $FileName to $AacName after retry" -ForegroundColor Red
                    exit 1
                } else {
                    Write-Host "Imported $FileName to $AacName successfully after retry" -ForegroundColor Green
                }
            } else {
                Write-Host "Imported $FileName to $AacName as application/json successfully" -ForegroundColor Green
            }
        }

        $importedFiles.Add($importedFileName, $FilePath)
    }

    function Import-Config {
        param (
            [string][Parameter(Mandatory)] $ConfigPath,
            [string][Parameter(Mandatory)][ValidateSet("service", "shared")] $ConfigScope,
            [bool]$DryRun = $false,
            [bool]$IsCommonSvc = $false
        )

        Write-Host "Check files under $ConfigPath"

        foreach ($file in Get-ChildItem $ConfigPath)
        {
            $target = Get-Item $file.FullName

            if ($target.PSIsContainer) {
                # skip folder
                continue
            }

            $fileName = Split-Path $file -Leaf

            if ($IsCommonSvc) {
                Import-ConfigFile -FileName $fileName -AacName $AacPrimaryName -FilePath $file.FullName -ConfigPrefix $configPrefix -ConfigScope $ConfigScope -DryRun $DryRun
                Import-ConfigFile -FileName $fileName -AacName $AacFailoverName -FilePath $file.FullName -ConfigPrefix $configPrefix -ConfigScope $ConfigScope -DryRun $DryRun
            } else {
                if ([bool]::Parse($IsPrimary)) {
                    Import-ConfigFile -FileName $fileName -AacName $AacPrimaryName -FilePath $file.FullName -ConfigPrefix $configPrefix -ConfigScope $ConfigScope -DryRun $DryRun
                } else {
                    Import-ConfigFile -FileName $fileName -AacName $AacFailoverName -FilePath $file.FullName -ConfigPrefix $configPrefix -ConfigScope $ConfigScope -DryRun $DryRun
                }
            }
        }
    }

    function GetKeyValueFromAac {
        param (
            [string]$ConfigPrefix,
            [string]$AacStoreName
        )
        # Run the az command to list all key-value pairs in the App Configuration store
        $appConfigKeys = az appconfig kv list --all --name "$AacStoreName" --key "$ConfigPrefix*" --query "[].{Key:key, Value:value}" --output json | ConvertFrom-Json

        # Loop through the key-value pairs and add them to the dictionary
        foreach ($key in $appConfigKeys) {
            $AacConfigDic.Add($key.Key, $key.Value)
        }
        return $AacConfigDic
    }


    # Convert the object to a nested dictionary
    function ConvertTo-Dictionary {
        param (
            [object]$Obj,
            [string]$KeyPrefix
        )
        $separator = ":"
        foreach ($property in $obj.PSObject.Properties) {
            $propertyKey = $keyPrefix + $property.Name
            if ($property.Value -is [System.Management.Automation.PSCustomObject]) {
                $childDict = ConvertTo-Dictionary -Obj $property.Value -KeyPrefix "$propertyKey$separator"
            } elseif ($property.Value -is [System.Array]) {
                $i = 0
                foreach ($item in $property.Value) {
                    $JsonConfigDic[$propertyKey + $separator + $i] = $item
                    $i++
                }
                $JsonConfigDic[$propertyKey] = $item
            } else {
                $JsonConfigDic[$propertyKey] = $property.Value
            }
        }
    }

    function GetKeyValueFromConfigFile
    {
        foreach ($file in $importedFiles.Keys)
        {
            $keyPrefix = $file.Split('-')[0]
            $json = Get-Content -Path $importedFiles[$file] -Raw
            $obj = ConvertFrom-Json -InputObject $json
            ConvertTo-Dictionary -Obj $obj -KeyPrefix $keyPrefix
        }
    }


    function FindDiffKeys {
        param (
            [string]$AacStoreName,
            [string]$ConfigPrefix
        )

        GetKeyValueFromConfigFile
        $KeysToDelete = @()
        $AacConfigDic = GetKeyValueFromAac -ConfigPrefix $ConfigPrefix -AacStoreName $AacStoreName

        Write-Host "AAC keys count" $AacConfigDic.Keys.Count

        Write-Host "JsonConfigDic keys count" $JsonConfigDic.Keys.Count

        foreach ($key in $AacConfigDic.Keys) {
            if (!$JsonConfigDic.ContainsKey($key)) {
                $KeysToDelete += $key
            }
        }
        return $KeysToDelete
    }

    $configPrefix = "{0}:{1}:" -f $ConfigScope, $SvcName

    $JsonConfigDic = @{}
    $AacConfigDic = @{}
    $importedFiles = @{}

    if ($IsCommonSvc -eq $false) {
        $Stamp = Get-PrimaryStampName -FailoverOrPrimaryStampName $Stamp
    }

    $byEnvStampSetting = "$ConfigSettingPath/Configurations/$ConfigScope/$Cloud/$Env/$Stamp"
    $byEnvSetting = "$ConfigSettingPath/Configurations/$ConfigScope/$Cloud/$Env"
    $byCloud = "$ConfigSettingPath/Configurations/$ConfigScope/$Cloud"
    $defaultSetting = "$ConfigSettingPath/Configurations/$ConfigScope"


    if (Test-Path -Path $byEnvStampSetting) {
        Import-Config -ConfigPath $byEnvStampSetting -ConfigScope $ConfigScope -DryRun $true -IsCommonSvc $IsCommonSvc
    }

    if (Test-Path -Path $byEnvSetting) {
        Import-Config -ConfigPath $byEnvSetting -ConfigScope $ConfigScope -DryRun $true -IsCommonSvc $IsCommonSvc
    }

    if (Test-Path -Path $byCloud) {
        Import-Config -ConfigPath $byCloud -ConfigScope $ConfigScope -DryRun $true -IsCommonSvc $IsCommonSvc
    }

    if (Test-Path -Path $defaultSetting) {
        Import-Config -ConfigPath $defaultSetting -ConfigScope $ConfigScope -DryRun $true -IsCommonSvc $IsCommonSvc
    }

    # convert stamp for scale unit services
    if ($IsCommonSvc -eq $false) {
        $Stamp = Get-PrimaryStampName -FailoverOrPrimaryStampName $Stamp
    }

    # Delete keys that are not present in JSON configuration files
    # For common service (global/regional service), we deploy configurations to primary and failover AAC at the same time,
    # so only compare the file stored key-value and failover aac stored key-value is enough
    if ($IsCommonSvc -or ($isPrimaryScaleUnit -eq $false)) {
        $toDeleteKeys = FindDiffKeys -AacStoreName $AacFailoverName -ConfigPrefix $configPrefix
    } else {
        $toDeleteKeys = FindDiffKeys -AacStoreName $AacPrimaryName -ConfigPrefix $configPrefix
    }

    foreach ($key in $toDeleteKeys)
    {
        if ($key -eq "shared:" + $SvcAlias + ":sentinel" -or $key -eq "service:" + $SvcAlias + ":sentinel") {
            continue
        }

        Write-Host "${key} exists in AAC but not in Json configuration files, will delete it from AAC"

        if ($IsCommonSvc) {
            az appconfig kv delete -n $AacFailoverName --key $key --yes
            az appconfig kv delete -n $AacPrimaryName --key $key --yes
        } else {
            if ($isPrimaryScaleUnit) {
                az appconfig kv delete -n $AacPrimaryName --key $key --yes
            } else {
                az appconfig kv delete -n $AacFailoverName --key $key --yes
            }
        }
    }

    $importedFiles = @{}

    if (Test-Path -Path $byEnvStampSetting) {
        Write-Host "----------------------Will import $ConfigScope Remote Configurations under path $byEnvStampSetting - By Environments, Scale Units----------------------"
        Import-Config -ConfigPath $byEnvStampSetting -ConfigScope $ConfigScope -IsCommonSvc $IsCommonSvc
    } else {
        Write-Host "----------------------Path byEnvStampSetting not found: $byEnvStampSetting----------------------"
    }

    if (Test-Path -Path $byEnvSetting) {
        Write-Host "----------------------Will import $ConfigScope Remote Configurations under path $byEnvSetting - By Environments----------------------"
        Import-Config -ConfigPath $byEnvSetting -ConfigScope $ConfigScope -IsCommonSvc $IsCommonSvc
    } else {
        Write-Host "----------------------Path byEnvSetting not found: $byEnvSetting"
    }

    if (Test-Path -Path $byCloud) {
        Write-Host "----------------------Will import $ConfigScope Remote Configurations under path $byCloud - By Cloud----------------------"
        Import-Config -ConfigPath $byCloud -ConfigScope $ConfigScope -IsCommonSvc $IsCommonSvc
    } else {
        Write-Host "----------------------Path byCloud not found: $byCloud"
    }

    if (Test-Path -Path $defaultSetting) {
        Write-Host "----------------------Will import $ConfigScope Remote Configurations under path $defaultSetting - Common Configurations----------------------"
        Import-Config -ConfigPath $defaultSetting -ConfigScope $ConfigScope -IsCommonSvc $IsCommonSvc
    } else {
        Write-Host "----------------------Path defaultSetting not found: $defaultSetting"
    }
}

function Login-By-UserAccount {
    param (
        [string]$SubscriptionId,
        [string]$AadTenantId,
        [string]$Ev2Env
    )

    $acct = $null
    $userObjectId = $null

    try {
        $acct = Set-AzContext -Subscription $SubscriptionId -Tenant $AadTenantId -ErrorAction Stop
        $userObjectId = (Get-AzADUser -upn "$($acct.Account.Id)").Id
    }
    catch {
        if ($Ev2Env -eq "Fairfax") {
            Connect-AzAccount -Tenant $AadTenantId -ErrorAction Stop -EnvironmentName AzureUSGovernment
        }
        else {
            Connect-AzAccount -Tenant $AadTenantId -ErrorAction Stop
        }

        $acct = Set-AzContext -Subscription $SubscriptionId -Tenant $AadTenantId -ErrorAction Stop
        $userObjectId = (Get-AzADUser -upn "$($acct.Account.Id)").Id
    }

    if (($acct -eq $null) -or ($userObjectId -eq $null)) {
        Enter-ExceptionHandler "Login-By-UserAccount" (New-Object System.Exception "Null 'acct' or '$userObjectId'")
    }

    Write-Host "Login succeeded with object ID: $userObjectId"

    return $userObjectId
}

function Login-By-UserManagedIdentity {
    param (
        [string]$SubscriptionId,
        [string]$AadTenantId,
        [string]$Ev2Env
    )

    $isLogin = $false
    for ($i = 0; $i -lt 10; $i++) {
        try {
            Write-Host "$($i+1) try: login Azure via user managed identity"

            if ($Ev2Env -eq "Fairfax") {
                Connect-AzAccount -Identity -Tenant $AadTenantId -ErrorAction Stop -EnvironmentName AzureUSGovernment
            }
            else {
                Connect-AzAccount -Identity -Tenant $AadTenantId -ErrorAction Stop
            }

            Set-AzContext -Subscription $SubscriptionId -Tenant $AadTenantId -ErrorAction Stop
            Write-Host "Login succeeded"

            $isLogin = $true
            break
        }
        catch {
            Start-Sleep -s 10
        }
    }

    if (!($isLogin)) {
        Enter-ExceptionHandler "Login-By-UserManagedIdentity" (New-Object System.Exception "Login failed")
    }
}

function Login-Azure {
    param (
        [string]$SubscriptionId,
        [bool]$Local,
        [string]$Env
    )

    # Use common subscription ID if not specified
    if ([string]::IsNullOrEmpty($SubscriptionId)) {
        $SubscriptionId = Get-SubscriptionId -Env $Env
    }

    $aadTenantId = Get-AadTenantId -Env $Env
    $ev2Env = Get-Ev2Env -Env $Env

    if ($Local) {
        return Login-By-UserAccount -SubscriptionId $SubscriptionId -AadTenantId $aadTenantId -Ev2Env $ev2Env
    }
    else {
        Login-By-UserManagedIdentity -SubscriptionId $SubscriptionId -AadTenantId $aadTenantId -Ev2Env $ev2Env
        return ""
    }
}

function Azure-Cli-Login-By-UserAccount {
    param (
        [string]$SubscriptionId,
        [string]$AadTenantId,
        [string]$Ev2Env
    )

    $acct = $null
    $userObjectId = $null

    if ($Ev2Env -eq "Fairfax") {
        az cloud set --name AzureUSGovernment
    }
    az login --tenant $AadTenantId --only-show-errors

    az account set --subscription $SubscriptionId
    $acct = az account show | ConvertFrom-Json
    $userObjectId = (az ad user show --id ($acct.user.Name) | ConvertFrom-Json).id

    if (($acct -eq $null) -or ($userObjectId -eq $null)) {
        Enter-ExceptionHandler "Azure-Cli-Login-By-UserAccount" (New-Object System.Exception "Null 'acct' or '$userObjectId'")
    }

    Write-Host "Login succeeded with object ID: $userObjectId"

    return $userObjectId
}

function Azure-Cli-Login-By-UserManagedIdentity {
    param (
        [string]$SubscriptionId,
        [string]$Ev2Env
    )

    $isLogin = $false
    for ($i = 0; $i -lt 10; $i++) {
        try {
            Write-Host "$($i+1) try: login Azure CLI via user managed identity"

            if ($Ev2Env -eq "Fairfax") {
                az cloud set --name AzureUSGovernment
            }
            az login --identity --only-show-errors

            if (!$?) {
                throw "ERROR: in az login"
            }

            az account set --subscription $SubscriptionId
            Write-Host "Login succeeded"

            $isLogin = $true
            break
        }
        catch {
            Start-Sleep -s 10
        }
    }

    if (!($isLogin)) {
        Enter-ExceptionHandler "Azure-Cli-Login-By-UserManagedIdentity" (New-Object System.Exception "Login failed")
    }
}

function Login-Azure-Cli {
    param (
        [string]$SubscriptionId,
        [bool]$Local,
        [string]$Env
    )

    # Use common subscription ID if not specified
    if ([string]::IsNullOrEmpty($SubscriptionId)) {
        $SubscriptionId = Get-SubscriptionId -Env $Env
    }

    $aadTenantId = Get-AadTenantId -Env $Env
    $ev2Env = Get-Ev2Env -Env $Env

    if ($Local) {
        return Azure-Cli-Login-By-UserAccount -SubscriptionId $subscriptionId -AadTenantId $aadTenantId -Ev2Env $ev2Env
    }
    else {
        Azure-Cli-Login-By-UserManagedIdentity -SubscriptionId $subscriptionId -Ev2Env $ev2Env
        return ""
    }
}

function Create-KeyVault-And-Grant-AccessPolicy {
    param (
        [string]$Env,
        [string]$UserObjectId,
        [string]$ResourceGroup,
        [string]$Location,
        [string]$KeyVaultName,
        [ValidateSet("Standard", "Premium")]
        [string]$Sku = "Standard",
        [string]$Stamp,
        [string]$Version,
        [string]$ServiceAlias
    )
    if (-not (Get-AzResourceGroup -Name $ResourceGroup -Location $Location -ErrorAction SilentlyContinue)) {
        Write-Host "Creating resource group: $ResourceGroup"
        New-AzResourceGroup -Name $ResourceGroup -Location $Location -ErrorAction Stop
    }
    else {
        Write-Host "Resource group: $ResourceGroup already exists"
    }

    $tags = @{ 'Stamp' = $Stamp; 'Environment' = $Env; 'Build' = $Version; 'MicroService' = $ServiceAlias; 'TimeStamp' = $(Get-Date -Format "yyyyMMddTHHmmssZ").ToString() }
    if (Get-AzKeyVault -Location $Location -VaultName $KeyVaultName -InRemovedState) {
        Undo-AzKeyVaultRemoval -Location $Location -VaultName $KeyVaultName -ResourceGroupName $ResourceGroup -ErrorAction Stop
        Write-Host "Key vault: $KeyVaultName restored"
    }

    if (-not (Get-AzKeyVault -VaultName $KeyVaultName -ResourceGroupName $ResourceGroup)) {
        New-AzKeyVault -VaultName $KeyVaultName -ResourceGroupName $ResourceGroup -Location $Location -EnabledForDeployment -EnabledForTemplateDeployment -EnabledForDiskEncryption -Sku $Sku -ErrorAction Stop -Tag $tags
        Write-Host "Key vault: $KeyVaultName created"
    }
    else {
        Write-Host "Key vault: $KeyVaultName already exists"
        Update-AzKeyVault -ResourceGroupName $ResourceGroup -VaultName $KeyVaultName -Tag $tags
    }

    Set-AzKeyVaultAccessPolicy -VaultName $KeyVaultName -ResourceGroupName $ResourceGroup -ObjectId $UserObjectId -PermissionsToKeys All -PermissionsToCertificates All -PermissionsToSecrets All -ErrorAction Stop
    Set-AzKeyVaultAccessPolicy -VaultName $KeyVaultName -ResourceGroupName $ResourceGroup -BypassObjectIdValidation -ObjectId (Get-Ev2ObjectId $Env) -PermissionsToKeys Get, List -PermissionsToSecrets Get, List -PermissionsToCertificates Get, List -ErrorAction Stop
    Set-AzKeyVaultAccessPolicy -VaultName $KeyVaultName -ResourceGroupName $ResourceGroup -BypassObjectIdValidation -ObjectId (Get-AntaresObjectId $Env) -PermissionsToKeys Get, List -PermissionsToSecrets Get, List -PermissionsToCertificates Get, List -ErrorAction Stop
}


function Create-KeyVault-Key {
    param (
        [string]$ResourceGroup,
        [string]$KeyVaultName,
        [string]$KeyName,
        [int]$ExpireInMonths,
        [int]$RotateInDays,
        [string]$Stamp,
        [string]$Version,
        [string]$ServiceAlias
    )
    Write-Host "`n`n******************************  Key Name: $KeyName"

    $tags = @{ 'RgName' = $ResourceGroup; 'ResourceName' = 'None'; 'CreatedBy' = 'CPC'; 'Stamp' = $Stamp; 'Environment' = $Env; 'Build' = $Version; 'MicroService' = $ServiceAlias; 'TimeStamp' = $(Get-Date -Format "yyyyMMddTHHmmssZ").ToString() }

    if (!$ExpireInMonths) {
        $ExpireInMonths = Get-DefaultKeyExpireInMonths
        Write-Host "Set default ExpireInMonths as: $ExpireInMonths"
    }

    if (!$RotateInDays) {
        $RotateInDays = Get-DefaultKeyRotateInDays
        Write-Host "Set default RotateInDays as: $RotateInDays"
    }

    $currentKey = Get-AzKeyVaultKey -VaultName $KeyVaultName -Name $KeyName

    if ($currentKey) {
        Update-AzKeyVaultKey -VaultName $KeyVaultName -Name $KeyName -Tag $tags -ErrorAction Stop
        Write-Host "Update key tags - Done"
    }

    if (!$currentKey -or !$currentKey.Expires) {
        $expires = (Get-Date).AddMonths($ExpireInMonths).ToUniversalTime()
        Add-AzKeyVaultKey -VaultName $KeyVaultName -Name $KeyName -Expires $expires -Destination Software -Tag $tags -ErrorAction Stop
        Write-Host "Create key - Done"
    }
    else {
        Write-Host "Key already exists"
    }

    $currentPolicy = Get-AzKeyVaultKeyRotationPolicy -VaultName $KeyVaultName -Name $KeyName
    # if policy not exist or only contains default Notify action
    if (!$currentPolicy -or ($currentPolicy.LifetimeActions.Count -eq 1)) {
        $action = [Microsoft.Azure.Commands.KeyVault.Models.PSKeyRotationLifetimeAction]::new()
        $action.Action = "Rotate"
        $action.TimeAfterCreate = New-TimeSpan -Days $RotateInDays
        Set-AzKeyVaultKeyRotationPolicy -VaultName $KeyVaultName -Name $KeyName -KeyRotationLifetimeAction $action -ErrorAction Stop
        Write-Host "Set key rotation policy - Done"
    }
    else {
        Write-Host "Rotation policy already exists"
        $currentPolicy
    }
}

function Create-KeyVault-Certificate {
    param (
        [string]$Env,
        [string]$UserObjectId,
        [string]$ResourceGroup,
        [string]$Location,
        [string]$KeyVaultName,
        [string]$IssuerName,
        [string]$ProviderName,
        [string]$CertName,
        [string]$CertSubject,
        [string[]]$CertDnsName,
        [int]$CertValidityInMonths,
        [int]$CertRenewalPercentage,
        [bool]$KeyNotExportable = $false,
        [string[]]$AdvancedKeyUsages = @(),
        [bool]$CertOnly = $false,
        [string]$Stamp,
        [string]$Version,
        [string]$ServiceAlias
    )
    Write-Host "`n`n******************************  Certificate Name: $CertName"

    $DefaultKeyUsages = @("DigitalSignature", "KeyEncipherment")
    $KeyUsage = $DefaultKeyUsages + $AdvancedKeyUsages
    $tags = @{ 'RgName' = $ResourceGroup; 'ResourceName' = 'None'; 'CreatedBy' = 'CPC'; 'Stamp' = $Stamp; 'Environment' = $Env; 'Build' = $Version; 'MicroService' = $ServiceAlias; 'TimeStamp' = $(Get-Date -Format "yyyyMMddTHHmmssZ").ToString() }

    if ($CertOnly -eq $false) {
        Create-KeyVault-And-Grant-AccessPolicy -Env $Env -UserObjectId $UserObjectId -ResourceGroup $ResourceGroup -Location $Location -KeyVaultName $KeyVaultName -Stamp $Stamp -Version $Version -ServiceAlias $ServiceAlias
    }

    if ($CertDnsName -eq $null) {
        $CertDnsName = $CertSubject
    }

    if ($CertValidityInMonths -eq 0) {
        $CertValidityInMonths = Get-DefaultCertValidityInMonths $Env
    }

    if ($CertRenewalPercentage -eq 0) {
        $CertRenewalPercentage = Get-DefaultCertRenewalPercentage $Env
    }

    Write-Host "`n----------------  Target policy: Begin  ----------------------"
    Write-Host "Subject: $CertSubject"
    Write-Host "DNS Name: $CertDnsName"
    Write-Host "ValidityInMonths: $CertValidityInMonths"
    Write-Host "RenewalPercentage: $CertRenewalPercentage"
    Write-Host "KeyNotExportable: $KeyNotExportable"
    Write-Host "KeyUsage: $KeyUsage"
    Write-Host "-----------------  Target policy: End   ----------------------`n"

    $succeeded = $false
    for ($i = 0; $i -lt 3; $i++) {
        try {
            Write-Host "$($i+1) try: create certificate"

            $currentCert = Get-AzKeyVaultCertificate -VaultName $KeyVaultName -Name $CertName
            $certOperation = Get-AzKeyVaultCertificateOperation -VaultName $KeyVaultName -Name $CertName
            if ($currentCert -and $currentCert.Enabled -and $certOperation.Status -eq "completed") {
                Write-Host "Certificate already exists and enabled, check policy now"

                $currentPolicy = Get-AzKeyVaultCertificatePolicy -VaultName $KeyVaultName -Name $CertName
                Write-Host "`n----------------  Current policy: Begin  ----------------------"
                $currentPolicy | Select-Object *
                Write-Host "-----------------  Current policy: End   ----------------------`n"

                # Check if policy is different or not
                if ($currentPolicy.SubjectName -eq "CN=$CertSubject" -and
                    (ConvertTo-Json -InputObject $currentPolicy.DnsNames) -eq (ConvertTo-Json -InputObject $CertDnsName) -and
                    ($currentPolicy.ValidityInMonths -eq $CertValidityInMonths) -and
                    ($currentPolicy.RenewAtPercentageLifetime -eq $CertRenewalPercentage) -and
                    (!($currentPolicy.Exportable) -eq $KeyNotExportable) -and
                    ((Compare-Object ($currentPolicy.KeyUsage | Sort-Object) ($KeyUsage | Sort-Object)) -eq $null)) {
                    Write-Host "Certificate policy is valid, skip"

                    Update-AzKeyVaultCertificate -VaultName $KeyVaultName -Name $CertName -Tag $tags -ErrorAction Stop

                    return
                }
            }

            if (!$currentCert) {
                Write-Host "Certificate does not exist, continue..."
            }
            else {
                Write-Host "Certificate already exists but its policy is not valid, continue..."
            }

            if (-not (Get-AzKeyVaultCertificateIssuer -VaultName $KeyVaultName -Name $IssuerName)) {
                Write-Host "Creating issuer: $IssuerName"
                Set-AzKeyVaultCertificateIssuer -VaultName $KeyVaultName -IssuerProvider $ProviderName -Name $IssuerName
            }
            else {
                Write-Host "Issuer: $IssuerName already exists"
            }

            if ($KeyNotExportable) {
                $certPolicy = New-AzKeyVaultCertificatePolicy -KeyNotExportable -SubjectName "CN=$CertSubject" -DnsName $CertDnsName -IssuerName $IssuerName -ValidityInMonths $CertValidityInMonths -RenewAtPercentageLifetime $CertRenewalPercentage -KeyUsage $KeyUsage
            }
            else {
                $certPolicy = New-AzKeyVaultCertificatePolicy -SubjectName "CN=$CertSubject" -DnsName $CertDnsName -IssuerName $IssuerName -ValidityInMonths $CertValidityInMonths -RenewAtPercentageLifetime $CertRenewalPercentage -KeyUsage $KeyUsage
            }

            Write-Host "Creating certificate"
            Add-AzKeyVaultCertificate -VaultName $KeyVaultName -Name $CertName -CertificatePolicy $certPolicy -Tag $tags -ErrorAction Stop | Out-Null

            Check-KeyVault-Certificate -KeyVaultName $KeyVaultName -CertName $CertName

            $succeeded = $true
            break
        }
        catch {
            Start-Sleep -s 120
        }
    }

    if (!($succeeded)) {
        throw "Create certificate failed"
    }
}

function Check-KeyVault-Certificate {
    param (
        [string]$KeyVaultName,
        [string]$CertName
    )
    $i = 0
    do {
        $i++
        Write-Host "$i try, wait until creation operation completes"
        Start-Sleep -s 10
        $certOperation = Get-AzKeyVaultCertificateOperation -VaultName $KeyVaultName -Name $CertName
    } while ($certOperation.Status -eq "inProgress")

    if ($certOperation.Status -ne "completed") {
        Write-Host "Certificate is disabled"
        Write-Host "Error code: $($certOperation.ErrorCode)"
        Write-Host "Error message: $($certOperation.ErrorMessage)"

        throw "Certificate: $CertName can not be enabled, please check!"
    }

    Write-Host "Certificate is enabled, done"
}

function Purge-KeyVault-Certificate {
    param (
        [string]$KeyVaultName,
        [string]$CertName
    )
    # Wait until deletion operation completes
    Remove-AzKeyVaultCertificate -VaultName $KeyVaultName -Name $CertName -Force -ErrorAction SilentlyContinue
    do {
        Start-Sleep -s 5
        $a = Get-AzKeyVaultCertificate -VaultName $KeyVaultName -Name $CertName
    } while ($a)

    Remove-AzKeyVaultCertificate -VaultName $KeyVaultName -Name $CertName -Force -InRemovedState
    do {
        Start-Sleep -s 5
        $a = Get-AzKeyVaultCertificate -VaultName $KeyVaultName -Name $CertName -InRemovedState -ErrorAction SilentlyContinue
    } while ($a)

    Write-Host "Purge delete certificate: [$CertName] in key vault: [$KeyVaultName] succeeded"
}

function New-EventHubSecrets {
    param (
        [string]$VaultName,
        [string]$ResourceGroup,
        [string]$EventHubName,
        [string]$NamespaceName,
        [string]$ListenPrimarySecretName,
        [string]$ListenSecondarySecretName,
        [string]$SendPrimarySecretName,
        [string]$SendSecondarySecretName
    )
    function New-EventHubSecretHelper {
        param (
            [string]$Descrip,
            [string]$KeyType,
            [string]$RuleName,
            [string]$KeyName,
            [int]$ExpiryYear,
            [string]$SecretName
        )
        $eventHubTagName = 'Eventhub:' + $EventHubName
        $tags = @{ 'Description' = $Descrip; 'ResourceID' = $eventHubTagName; 'UsageType' = 'EventHubConnectionString'; 'SecretType' = 'ConnectionString'; 'KeyType' = $KeyType; 'AuthRule' = $RuleName; 'EventhubNamespace' = $NamespaceName; 'RgName' = $ResourceGroup; 'ResourceName' = $NamespaceName; 'EventHubName' = $EventHubName }
        $keysFromEH = Get-AzEventHubKey -ResourceGroupName $ResourceGroup -NamespaceName $NamespaceName -EventHubName $EventHubName -Name $RuleName
        $secretNewValue = $keysFromEH.$KeyName

        New-AzResourceSecret -VaultName $VaultName -SecretName $SecretName -SecretNewValue $secretNewValue -ExpiryYear $ExpiryYear -Tags $tags
    }
    New-EventHubSecretHelper -Descrip 'Stores primary Listen key for EventHub' -KeyType 'Primary' -RuleName 'Listen' -KeyName 'primaryConnectionString' -ExpiryYear 1 -SecretName $ListenPrimarySecretName
    New-EventHubSecretHelper -Descrip 'Stores secondary Listen key for EventHub' -KeyType 'Secondary' -RuleName 'Listen' -KeyName 'secondaryConnectionString' -ExpiryYear 2 -SecretName $ListenSecondarySecretName
    New-EventHubSecretHelper -Descrip 'Stores primary Send key for EventHub' -KeyType 'Primary' -RuleName 'Send' -KeyName 'primaryConnectionString' -ExpiryYear 1 -SecretName $SendPrimarySecretName
    New-EventHubSecretHelper -Descrip 'Stores secondary Send key for EventHub' -KeyType 'Secondary' -RuleName 'Send' -KeyName 'secondaryConnectionString' -ExpiryYear 2 -SecretName $SendSecondarySecretName
}

function New-CosomosDbSecrets {
    param (
        [string]$CosmosDbResourceGroup,
        [string]$CosmosDbAccountName,
        [string]$VaultName,
        [string]$ResourceGroup,
        [string]$StampName,
        [string]$EnvName,
        [string]$Version,
        [string]$SvcName,
        [string]$PrimarySecretName,
        [string]$PrimaryReadOnlySecretName,
        [string]$SecondarySecretName,
        [string]$SecondaryReadOnlySecretName,
        [string]$primaryConnectionStringSecretName,
        [string]$secondaryConnectionStringSecretName
    )
    function New-CosmosDbSecretHelper {
        param (
            [string]$KeyName,
            [int]$ExpiryYear,
            [bool]$SetConnectionString,
            [string]$SecretName,
            [string]$KeyType
        )
        $tags = @{ 'Stamp' = $StampName; 'Environment' = $EnvName; 'Build' = $Version; 'Microservice' = $SvcName; 'SecretType' = 'CosmosDbKey'; 'KeyType' = $KeyType; 'RgName' = $ResourceGroup; 'ResourceName' = $CosmosDbAccountName }

        # Use common subscription ID if not specified
        $subscriptionId = Get-SubscriptionId -Env $EnvName
        $resourceId = "/subscriptions/$subscriptionId/resourceGroups/$CosmosDbResourceGroup/providers/Microsoft.DocumentDB/databaseAccounts/$CosmosDbAccountName"

        if ($SetConnectionString) {
            $connectionStringObject = Invoke-AzResourceAction -Action listConnectionStrings -ResourceId $resourceId -Force -ErrorAction Stop
            for ($i = 0; $i -lt $connectionStringObject.connectionStrings.Length; $i++) {
                if ($connectionStringObject.connectionStrings[$i].description -eq $KeyName) {
                    $secretNewValue = $connectionStringObject.connectionStrings[$i].connectionString
                    break
                }
            }
        }
        else {
            $keysFromDb = Invoke-AzResourceAction -Action listKeys -ResourceId $resourceId -Force -ErrorAction Stop
            $SecretNewValue = $keysFromDb.$KeyName
        }

        New-AzResourceSecret -VaultName $VaultName -SecretName $SecretName -SecretNewValue $secretNewValue -ExpiryYear $ExpiryYear -Tags $tags
    }

    New-CosmosDbSecretHelper -KeyName 'primaryMasterKey' -ExpiryYear 1 -SetConnectionString $false -SecretName $PrimarySecretName -KeyType 'Primary'
    New-CosmosDbSecretHelper -KeyName 'primaryReadonlyMasterKey' -ExpiryYear 1 -SetConnectionString $false -SecretName $PrimaryReadOnlySecretName -KeyType 'PrimaryReadOnly'
    New-CosmosDbSecretHelper -KeyName 'secondaryMasterKey' -ExpiryYear 2 -SetConnectionString $false -SecretName $SecondarySecretName -KeyType 'Secondary'
    New-CosmosDbSecretHelper -KeyName 'secondaryReadonlyMasterKey' -ExpiryYear 2 -SetConnectionString $false -SecretName $SecondaryReadOnlySecretName -KeyType 'SecondaryReadOnly'
    New-CosmosDbSecretHelper -KeyName 'Primary SQL Connection String' -ExpiryYear 1 -SetConnectionString $true -SecretName $primaryConnectionStringSecretName -KeyType 'Primary'
    New-CosmosDbSecretHelper -KeyName 'Secondary SQL Connection String' -ExpiryYear 2 -SetConnectionString $true -SecretName $secondaryConnectionStringSecretName -KeyType 'Secondary'
}

function New-EventGridSecrets {
    param (
        [string]$VaultName,
        [string]$ResourceGroup,
        [string]$StampName,
        [string]$EnvName,
        [string]$Version,
        [string]$PrimarySecretName,
        [string]$SecondarySecretName,
        [string]$EndpointSecretName,
        [string]$EventGridName,
        [string]$EventGridResourceGroup
    )

    function New-EventGridSecretHelper {
        param (
            [string]$KeyName,
            [string]$ExpiryYear,
            [bool]$SetEndpointSecret,
            [string]$SecretName,
            [string]$KeyType,
            [string]$Descrip
        )
        $tags = @{ 'Stamp' = $StampName; 'Environment' = $EnvName; 'Build' = $Version; 'SecretType' = 'Key'; 'KeyType' = $KeyType; 'Description' = $Descrip; 'UsageType' = 'EventGridTopicKey'; 'RgName' = $EventGridResourceGroup; 'ResourceName' = $EventGridName }
        if ($SetEndpointSecret) {
            $keysFromEG = Get-AzEventGridTopic -ResourceGroupName $EventGridResourceGroup -Name $EventGridName
            $secretNewValue = $keysFromEG.Endpoint
        }
        else {
            $keysFromEG = Get-AzEventGridTopicKey -ResourceGroup $EventGridResourceGroup -Name $EventGridName
            $secretNewValue = $keysFromEG.$KeyName
        }
        New-AzResourceSecret -VaultName $VaultName -SecretName $SecretName -SecretNewValue $secretNewValue -ExpiryYear $ExpiryYear -Tags $tags
    }

    New-EventGridSecretHelper -KeyName 'Key1' -ExpiryYear 1 -SetEndpointSecret $false -SecretName $PrimarySecretName -KeyType 'Primary' -Descrip 'Stores primary read key for EventGrid topic'
    New-EventGridSecretHelper -KeyName 'Key2' -ExpiryYear 2 -SetEndpointSecret $false -SecretName $SecondarySecretName -KeyType 'Secondary' -Descrip 'Stores secondary read key for EventGrid topic'
    New-EventGridSecretHelper -KeyName '' -ExpiryYear 1 -SetEndpointSecret $true -SecretName $EndpointSecretName -KeyType 'Primary' -Descrip 'Stores topic endpoint for EventGrid topic'
}

function New-StorageSecrets {
    param (
        [string]$StorageAccountName,
        [string]$VaultName,
        [string]$ResourceGroup,
        [string]$StampName,
        [string]$EnvName,
        [string]$Version,
        [string]$SvcName,
        [string]$StorageEndpointSuffix,
        [string]$PrimarySecretName,
        [string]$SecondarySecretName,
        [string]$PrimaryConnectionStringSecretName,
        [string]$SecondaryConnectionStringSecretName
    )

    function New-StorageSecretHelper {
        param (
            [string]$Index,
            [int]$ExpiryYear,
            [bool]$SetConnectionString,
            [string]$SecretName,
            [string]$KeyType
        )
        $tags = @{ 'Stamp' = $StampName; 'Environment' = $EnvName; 'Build' = $Version; 'Microservice' = $SvcName; 'SecretType' = 'StorageKey'; 'KeyType' = $KeyType; 'RgName' = $ResourceGroup; 'ResourceName' = $StorageAccountName }
        $keysFromSA = Invoke-AzResourceAction -Action listKeys -ResourceType 'Microsoft.Storage/storageAccounts' -ApiVersion '2019-06-01' -ResourceGroupName $ResourceGroup -Name $StorageAccountName -Force -ErrorAction Stop
        $keyValue = $keysFromSA.keys[$Index].value
        if ($SetConnectionString) {
            $secretNewValue = 'DefaultEndpointsProtocol=https;AccountName=' + $StorageAccountName + ';AccountKey=' + $keyValue + ';EndpointSuffix=' + $StorageEndpointSuffix
        }
        else {
            $secretNewValue = $keyValue
        }
        New-AzResourceSecret -VaultName $VaultName -SecretName $SecretName -SecretNewValue $secretNewValue -ExpiryYear $ExpiryYear -Tags $tags
    }

    New-StorageSecretHelper -Index 0 -ExpiryYear 1 -SetConnectionString $false -SecretName $PrimarySecretName -KeyType 'Primary'
    New-StorageSecretHelper -Index 1 -ExpiryYear 2 -SetConnectionString $false -SecretName $SecondarySecretName -KeyType 'Secondary'
    New-StorageSecretHelper -Index 0 -ExpiryYear 1 -SetConnectionString $true -SecretName $PrimaryConnectionStringSecretName -KeyType 'Primary'
    New-StorageSecretHelper -Index 1 -ExpiryYear 2 -SetConnectionString $true -SecretName $SecondaryConnectionStringSecretName -KeyType 'Secondary'
}

function New-ServiceBusSecrets {
    param (
        [string]$NamespaceName,
        [string]$VaultName,
        [string]$ResourceGroup,
        [string]$StampName,
        [string]$EnvName,
        [string]$Version,
        [string]$SvcName,
        [string]$SecretName
    )

    function New-ServiceBusSecretHelper {
        param (
            [int]$ExpiryYear,
            [string]$SecretName,
            [string]$KeyType,
            [string]$KeyName
        )
        $tags = @{ 'Stamp' = $StampName; 'Environment' = $EnvName; 'Build' = $Version; 'Microservice' = $SvcName; 'SecretType' = 'ServiceBusKey'; 'KeyType' = $KeyType; 'RgName' = $ResourceGroup; 'ResourceName' = $NamespaceName }
        $keysFromSB = Get-AzServiceBusKey -ResourceGroupName $ResourceGroup -Namespace $NamespaceName -Name 'RootManageSharedAccessKey'
        $secretNewValue = $keysFromSB.$KeyName
        New-AzResourceSecret -VaultName $VaultName -SecretName $SecretName -SecretNewValue $secretNewValue -ExpiryYear $ExpiryYear -Tags $tags
    }

    New-ServiceBusSecretHelper -ExpiryYear 1 -SecretName $SecretName -KeyType 'Primary' -KeyName 'primaryConnectionString'
}

function New-RedisSecrets {
    param (
        [string]$VaultName,
        [string]$ResourceGroup,
        [string]$PrimarySecretName,
        [string]$SecondarySecretName,
        [string]$RedisName,
        [string]$RedisResourceGroup,
        [string]$RedisEndpoint
    )

    function New-RedisSecretHelper {
        param (
            [int]$ExpiryYear,
            [string]$SecretName,
            [string]$KeyName
        )
        $tags = @{ 'RgName' = $RedisResourceGroup; 'ResourceName' = $RedisName }
        $keysFromRC = Get-AzRedisCacheKey -ResourceGroupName $RedisResourceGroup -Name $RedisName
        $placeholderPwd = $keysFromRC.$KeyName
        $secretNewValue = $RedisName + '.' + $RedisEndpoint + ':6380,password=' + $placeholderPwd + ',ssl=True,abortConnect=False'

        New-AzResourceSecret -VaultName $VaultName -SecretName $SecretName -SecretNewValue $secretNewValue -ExpiryYear $ExpiryYear -Tags $tags
    }

    New-RedisSecretHelper -ExpiryYear 1 -SecretName $PrimarySecretName -KeyName 'primaryKey'
    New-RedisSecretHelper -ExpiryYear 2 -SecretName $SecondarySecretName -KeyName 'secondaryKey'
}

function New-AzResourceSecret {
    param (
        [string]$VaultName,
        [string]$SecretName,
        [string]$SecretNewValue,
        [int]$ExpiryYear = 2,
        [object]$Tags
    )
    $cpcTag = @{ 'CreatedBy' = 'CPC' }
    $Tags = $Tags + $cpcTag | Select-Object -uniq
    $secret = Get-AzKeyVaultSecret -VaultName $VaultName -Name $SecretName
    $secretOriginalValue = Get-AzKeyVaultSecret -VaultName $VaultName -Name $SecretName -AsPlainText

    if ($secret -ne $null) {
        Update-AzKeyVaultSecret -VaultName $VaultName -Name $SecretName -Tag $Tags -ErrorAction Stop
    }

    if (($secret -eq $null) -or ($secret.Expires -eq $null) -or ($secretOriginalValue -ne $SecretNewValue)) {
        Write-Output 'Ready to Set Secret. Secret Name is ' + $SecretName
        $secretValue = ConvertTo-SecureString -String $SecretNewValue -AsPlainText -Force
        $expireAt = (Get-Date).AddYears($ExpiryYear).ToUniversalTime()
        Set-AzKeyVaultSecret -VaultName $VaultName -Name $SecretName -SecretValue $secretValue -Expires $expireAt -Tags $Tags -ErrorAction Stop
    }
}

function TrafficManagerLocator {
    param (
        [string]$ResourceGroupName,
        [string]$TrafficManagerName,
        [string]$TargetLocation
    )
    $trafficManager = Get-AzTrafficManagerProfile -Name $TrafficManagerName -ResourceGroupName $ResourceGroupName
    $trafficManagerEndpoints = $trafficManager.Endpoints
    $locationArray = @()
    foreach ($endpoint in $trafficManagerEndpoints) {
        if ($endpoint.EndpointStatus -eq 'Enabled') {
            $locationArray += $endpoint.Location.Replace(' ', '').ToLower()
        }
    }
    $isEnabled = $locationArray.Contains($TargetLocation.Replace(' ', '').ToLower())
    return $isEnabled
}

function Get-ASEIP {
    param (
        [string]$SubscriptionsId,
        [string]$ResourceGroup,
        [string]$AseName,
        [string]$Cloud
    )
    $vip = ""
    $azContext = Get-AzContext
    $azProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile
    $profileClient = New-Object -TypeName Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient -ArgumentList ($azProfile)
    $token = $profileClient.AcquireAccessToken($azContext.Subscription.TenantId)
    $authHeader = @{
        "Content-Type" = "application/json"
        "Authorization" = "Bearer " + $token.AccessToken
    }
    $armEndpoint = ""
    switch ($Cloud) {
        "public" { $armEndpoint = "https://management.azure.com/" }
        "fairfax" { $armEndpoint = "https://management.usgovcloudapi.net/" }
        default { Write-Host "Could not find ARM endpoint for cloud: $Cloud"; exit 1 }
    }

    $restUri = $armEndpoint + "subscriptions/$($subscriptionsId)/resourceGroups/$($resourceGroup)/providers/Microsoft.Web/hostingEnvironments/$($aseName)?api-version=2019-08-01"
    $ase = Invoke-RestMethod -Uri $restUri -Method Get -Headers $authHeader
    if (($ase.properties.internalLoadBalancingMode -eq "None") -and ($ase.properties.networkingConfiguration -eq $null)) {
        # it is ASEv2 type
        $restUri = $armEndpoint + "subscriptions/$($subscriptionsId)/resourceGroups/$($resourceGroup)/providers/Microsoft.Web/hostingEnvironments/$($aseName)/capacities/virtualip?api-version=2019-08-01"
        $ase = Invoke-RestMethod -Uri $restUri -Method Get -Headers $authHeader
        $vip = $ase.properties.serviceIpAddress
    }
    else {
        # ASEv3
        if ($ase.properties.internalLoadBalancingMode -eq "None") {
            # external type
            $vip = $ase.properties.networkingConfiguration.externalInboundIpAddresses | Out-String
        }
        else {
            # internal type
            $vip = $ase.properties.networkingConfiguration.internalInboundIpAddresses | Out-String
        }
    }
    $vip = $vip.Trim()
    return $vip
}
