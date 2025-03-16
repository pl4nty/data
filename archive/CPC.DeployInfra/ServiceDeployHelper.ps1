$downloadPath = "$env:USERPROFILE\.deploytools"
$serviceToolsPath = "$downloadPath\ServiceTools"
$serviceExe = "$serviceToolsPath\ServiceTools.exe"
$applicationSourcePath = "$serviceToolsPath\Application"
$infraToolsPath = "$downloadPath\InfraTools"
$infraExe = "$infraToolsPath\InfraTools.exe"
$configFilesPath = "$downloadPath\ConfigFiles"

function Restore-DeployInfraPackage {
    param (
        [string]$VersionOverride = "UNDEFINED"
    )

    # get current branch name from pipeline
    $sourceBranch = $env:BUILD_SOURCEBRANCH
    $pullRequestTargetBranch = $env:SYSTEM_PULLREQUEST_TARGETBRANCH
    if (-not $sourceBranch) {
        $targetBranch = "LOCAL_BRANCH"
    }
    else {
        if ($sourceBranch.StartsWith("refs/heads/")) {
            $targetBranch = $sourceBranch.substring(11)
        }
        else {
            $targetBranch = $pullRequestTargetBranch.substring(11)
        }
    }

    # use different versions of DeployInfra based on branch if not specified
    if ($VersionOverride -eq "UNDEFINED") {
        if ($targetBranch -eq "release") {
            $buildVersion = "*"
        }
        elseif (($targetBranch -eq "develop") -or ($targetBranch -eq "LOCAL_BRANCH")) {
            $buildVersion = "*-beta*"
        }
        else {
            $buildVersion = "*"
        }
    }
    else {
        $buildVersion = $VersionOverride
    }

    Write-Host "[DeployInfra] sourceBranch: '$sourceBranch'"
    Write-Host "[DeployInfra] pullRequestTargetBranch: '$pullRequestTargetBranch'"
    Write-Host "[DeployInfra] targetBranch: '$targetBranch'"
    Write-Host "[DeployInfra] versionOverride: '$VersionOverride'"
    Write-Host "[DeployInfra] buildVersion: '$buildVersion'"

    # clean up existing files before restore
    if (Test-Path $downloadPath) {
        Get-ChildItem $downloadPath -Recurse | Remove-Item -Recurse -Force
    }
    else {
        New-Item $downloadPath -ItemType Directory
    }

    # create .csproj file first with target Nuget version
    # Notes: only dotnet restore supports floating version
    # https://docs.microsoft.com/en-us/nuget/concepts/package-versioning#examples
    $projFilePath = "$downloadPath\DeployInfra.csproj"
    $content =
    @"
    <Project Sdk="Microsoft.NET.Sdk">
    <PropertyGroup>
    <TargetFramework>net6.0</TargetFramework>
    </PropertyGroup>
    <ItemGroup>
    <PackageReference Include="Microsoft.Management.Services.CloudPC.DeployInfra" Version="$buildVersion" />
    </ItemGroup>
    </Project>
"@
    $content | Out-File -FilePath $projFilePath

    $source = "https://microsoft.pkgs.visualstudio.com/CMD/_packaging/CMD/nuget/v3/index.json"
    dotnet restore $projFilePath --source $source --packages $downloadPath

    $packageName = "microsoft.management.services.cloudpc.deployinfra"
    $packagePath = "$downloadPath\$packageName"
    $versionRestored = (Get-ChildItem $packagePath)[0].Name
    $sourcePath = "$packagePath\$versionRestored\content"

    # create subfolders first
    New-Item $serviceToolsPath -ItemType Directory -Force
    New-Item $infraToolsPath -ItemType Directory -Force

    Copy-Item -Path "$sourcePath\Application" -Destination $applicationSourcePath -Force -Recurse -ErrorAction Stop
    Copy-Item "$sourcePath\ServiceTools.exe" -Destination $serviceExe -Force -ErrorAction Stop
    Copy-Item "$sourcePath\InfraTools.exe" -Destination $infraExe -Force -ErrorAction Stop
    Copy-Item -Path "$sourcePath\ConfigFiles" -Destination $configFilesPath -Force -Recurse -ErrorAction Stop

    # FIXME
    # Some repo will copy some file from DeployInfra SDK for local test.
    # However, after adopting consumer, DeployInfra's folder structure has been changed,
    # which means original file path in service repos is not correct any more.
    # To unblock services, we still keep the same folder especially, but we need to fix the file path eventually.
    if (Test-Path "$configFilesPath\Consumer") {
        Copy-Item "$configFilesPath\Enterprise\InfraConfigs.json" "$configFilesPath"
        New-Item "$applicationSourcePath\Config" -ItemType Directory -Force
        Copy-Item "$applicationSourcePath\Enterprise\Config\scaleUnitUrls.json" "$applicationSourcePath\Config"
    } else {
        New-Item "$configFilesPath\Enterprise" -ItemType Directory -Force
        Copy-Item "$configFilesPath\InfraConfigs.json" "$configFilesPath\Enterprise"
        New-Item "$applicationSourcePath\Enterprise\Config" -ItemType Directory -Force
        Copy-Item "$applicationSourcePath\Config\scaleUnitUrls.json" "$applicationSourcePath\Enterprise\Config"
    }

    Write-Host -ForegroundColor Green "`n[DeployInfra] Restored version: $versionRestored successfully`n"
}

function Build-Ev2Artifacts {
    param (
        [string]$Ev2Path,
        [string]$ConfigPath,
        [string]$CustomSettingsFile,
        [string]$RolloutPath,
        [string]$ServiceVersion
    )

    # FIXME
    # file hierarchy is changed after supporting both Enterprise and Consumer
    # need temp code to adopt both cases
    if (Test-Path "$configFilesPath\Consumer") {
        $supportConsumer = $true
    } else {
        $supportConsumer = $false
    }

    # get info from config file
    $configFile = (Get-ChildItem $ConfigPath)[0]
    $jsonData = Get-Content "$ConfigPath\$($configFile.Name)" | Out-String | ConvertFrom-Json
    $serviceAlias = $jsonData.alias
    if ($null -eq $serviceAlias) {
        Write-Error "Service alias is required"
        exit 1
    }
    Write-Host "[DeployInfra] Service alias: $serviceAlias"

    $productType = $jsonData.productType
    if ($null -eq $productType) {
        Write-Host "[DeployInfra] Set default product type"
        $productType = "Enterprise"
    }
    Write-Host "[DeployInfra] Product type: $productType"

    if (Test-Path $Ev2Path) {
        Get-ChildItem $Ev2Path -Recurse | Remove-Item -Recurse -Force
    }

    # copy auto-generated ARM templates directly
    if ($supportConsumer) {
        Copy-Item "$applicationSourcePath\$productType\Templates" -Destination "$Ev2Path\Templates" -Force -Recurse -ErrorAction Stop
    } else {
        Copy-Item "$applicationSourcePath\Templates" -Destination "$Ev2Path\Templates" -Force -Recurse -ErrorAction Stop
    }

    if ($ServiceVersion) {
        $buildVersion = $ServiceVersion
    }
    else {
        # get build version from ADO pipeline
        $buildVersion = $env:CDP_FILE_VERSION_NUMERIC
    }

    if (-not $buildVersion) {
        # local build version is always "1.0.0.1"
        $buildVersion = "1.0.0.1"
    }

    Write-Host "`n[DeployInfra] Build version: $buildVersion"

    $commonArgs = @(
        "-o", "$Ev2Path",
        "-f", "$ConfigPath"
    )
    if ("$RolloutPath" -ne "") {
        $commonArgs += @("-r", "$RolloutPath")
    }
    if ("$CustomSettingsFile" -ne "") {
        $commonArgs += @("-m", "$CustomSettingsFile")
    }
    # FIXME
    if ($supportConsumer) {
        $commonArgs += @("-p", "$productType")
    }

    Write-Host "[DeployInfra] Common args:"
    $commonArgs
    Write-Host "`n"

    $buildArgs = @("-b", "-v", "$buildVersion") + $commonArgs
    & $serviceExe $buildArgs
    if ($LASTEXITCODE -eq 0) {
        Write-Host -ForegroundColor Green "[DeployInfra] Build successfully"
    }
    else {
        Write-Host -ForegroundColor Red "[DeployInfra] Build failed"
        exit 1
    }

    # group auto-generated resource manifest files and shell extension together
    # and compress them into Application.zip
    # FIXME
    if ($supportConsumer) {
        $compress = @{
            Path = "$applicationSourcePath\$productType\ShellExtensions\*", "$Ev2Path\ResourceManifests\*"
            CompressionLevel = "Fastest"
            DestinationPath = "$Ev2Path\Application.zip"
        }
    } else {
        $compress = @{
            Path = "$applicationSourcePath\ShellExtensions\*", "$Ev2Path\ResourceManifests\*"
            CompressionLevel = "Fastest"
            DestinationPath = "$Ev2Path\Application.zip"
        }
    }
    Compress-Archive @compress -Force -ErrorAction Stop
    Write-Host -ForegroundColor Green "[DeployInfra] Compress files successfully"

    $ev2Bin = "$Ev2Path\bin"

    if ($productType -eq "Enterprise") {
        $binWebPath = "$ev2Bin\$serviceAlias.WebApp"
        $binFunctionPath = "$ev2Bin\$serviceAlias.FunctionApp"
    } else {
        $binWebPath = "$ev2Bin\def.WebApp"
        $binFunctionPath = "$ev2Bin\def.FunctionApp"
    }

    # copy generated files under $Ev2Path\Config folder into bin\WebApp and bin\FunctionApp separately
    # e.g., appsettings.{env}.json, parameters.xml
    Copy-Item -Path "$Ev2Path\Config" -Destination $binWebPath -Force -Recurse -ErrorAction Stop
    Copy-Item -Path "$Ev2Path\Config" -Destination $binFunctionPath -Force -Recurse -ErrorAction Stop

    # copy infraConfigs.json and cloudpc.microservice.json into bin\WebApp and bin\FunctionApp
    # FIXME
    if ($supportConsumer) {
        Copy-Item -Path "$configFilesPath\$productType\*" -Destination $binWebPath -Force -Recurse -ErrorAction Stop
        Copy-Item -Path "$configFilesPath\$productType\*" -Destination $binFunctionPath -Force -Recurse -ErrorAction Stop
    } else {
        Copy-Item -Path "$configFilesPath\*" -Destination $binWebPath -Force -Recurse -ErrorAction Stop
        Copy-Item -Path "$configFilesPath\*" -Destination $binFunctionPath -Force -Recurse -ErrorAction Stop
    }

    Write-Host -ForegroundColor Green "[DeployInfra] Copy config files successfully"

    $checkArgs = @("-c") + $commonArgs
    & $serviceExe $checkArgs
    if ($LASTEXITCODE -eq 0) {
        Write-Host -ForegroundColor Green "[DeployInfra] Check successfully"
    }
    else {
        Write-Host -ForegroundColor Red "[DeployInfra] Check failed"
        exit 1
    }

    $bindArgs = @("-d", "-n", "All") + $commonArgs
    & $serviceExe $bindArgs
    if ($LASTEXITCODE -eq 0) {
        Write-Host -ForegroundColor Green "[DeployInfra] Bind successfully"
    }
    else {
        Write-Host -ForegroundColor Red "[DeployInfra] Bind failed"
        exit 1
    }
}

function Build-CustomEv2Artifacts {
    param (
        [ValidateSet("Enterprise", "Consumer")]
        [string]$ProductType = "Enterprise",
        [string]$Ev2Path,
        [string]$CustomRolloutConfigsDir,
        [string]$ParameterDir,
        [string]$ScriptDir
    )

    # FIXME
    # file hierarchy is changed after supporting both Enterprise and Consumer
    # need temp code to adopt both cases
    if (Test-Path "$configFilesPath\Consumer") {
        $supportConsumer = $true
    } else {
        $supportConsumer = $false
    }

    if (Test-Path $Ev2Path) {
        Get-ChildItem $Ev2Path -Recurse | Remove-Item -Recurse -Force
    }
    else {
        New-Item $Ev2Path -ItemType Directory
    }

    if (Test-Path $ParameterDir) {
        # Copy parameter file to ev2\Parameters this folder
        Copy-Item $ParameterDir -Destination "$Ev2Path\Parameters" -Force -Recurse -ErrorAction Stop
    }
    else {
        Write-Host -ForegroundColor Red "parameter file directory doesn't exist, please check!"
        exit 1
    }

    if (Test-Path $ScriptDir) {
        # Pack PowerShell scripts to CustomScript.zip if this path exist
        # Pack CMD.DeployHelper scripts as well for custom script to use
        # FIXME
        if ($supportConsumer) {
            $compress = @{
                Path = "$ScriptDir\*", "$applicationSourcePath\Enterprise\ShellExtensions\CMD.*"
                CompressionLevel = "Fastest"
                DestinationPath = "$Ev2Path\CustomScript.zip"
            }
        } else {
            $compress = @{
                Path = "$ScriptDir\*", "$applicationSourcePath\ShellExtensions\CMD.*"
                CompressionLevel = "Fastest"
                DestinationPath = "$Ev2Path\CustomScript.zip"
            }
        }
        Compress-Archive @compress -Force -ErrorAction Stop
    }

    # get build version from ADO pipeline
    $buildVersion = $env:CDP_FILE_VERSION_NUMERIC
    if (-not $buildVersion) {
        # local build version is always "1.0.0.1"
        $buildVersion = "1.0.0.1"
    }

    $commonArgs = @(
        "-o", "$Ev2Path",
        "-r", "$CustomRolloutConfigsDir"
    )
    # FIXME
    if ($supportConsumer) {
        $commonArgs += @("-p", "$ProductType")
    }

    $buildArgs = @("-u", "-v", "$buildVersion") + $commonArgs
    & $infraExe $buildArgs
    if ($LASTEXITCODE -eq 0) {
        Write-Host -ForegroundColor Green "[DeployInfra] Custom Script Artifact Build successfully"
    }
    else {
        Write-Host -ForegroundColor Red "[DeployInfra] Custom Script Artifact Build failed"
        exit 1
    }

    $bindArgs = @("-d", "-n", "All") + $commonArgs
    & $infraExe $bindArgs
    if ($LASTEXITCODE -eq 0) {
        Write-Host -ForegroundColor Green "[DeployInfra] Custom Script Bind successfully"
    }
    else {
        Write-Host -ForegroundColor Red "[DeployInfra] Custom Script Bind failed"
        exit 1
    }
}
