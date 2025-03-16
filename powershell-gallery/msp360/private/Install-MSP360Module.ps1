function Install-MSP360Module {
    [CmdletBinding()]
    param (
        [Parameter()]
        [bool]
        $AllowAlpha,
        [Parameter()]
        [string]
        $RequiredVersion,
        [Parameter()]
        [switch]
        $CleanInstall
    )

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    @(
        @{
            Module = "PackageManagement"
            Version = "1.4.6"
        },
        @{
            Module = "PowerShellGet"
            Version = "2.2.3"
    }) | ForEach-Object -Process {
        if ($Host.Version.Major -lt 5){
            Add-Type -AssemblyName System.IO.Compression.FileSystem -ErrorAction Stop
            if((Get-Module $_.Module -ListAvailable -ErrorAction SilentlyContinue).Version -lt [System.Version]$_.Version){
                (New-Object Net.WebClient).DownloadFile("https://www.powershellgallery.com/api/v2/package/$($_.Module)", "$ENV:TEMP\$($_.Module).zip")
                $Null = New-Item -Path "$ENV:windir\System32\WindowsPowerShell\v1.0\Modules" -Name $_.Module -ItemType "directory" -ErrorAction SilentlyContinue
                [System.IO.Compression.ZipFileExtensions]::ExtractToDirectory(([System.IO.Compression.ZipFile]::Open("$ENV:TEMP\$($_.Module).zip", 'read')), "$ENV:windir\System32\WindowsPowerShell\v1.0\Modules\$($_.Module)")
            }
        }else{
            if((Get-PackageProvider -Name NuGet -ListAvailable -ErrorAction SilentlyContinue | Select-Object -First 1).Version -lt [System.Version]"2.8.5.201"){
                $Null = Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
            }
            if((Get-Module $_.Module -ListAvailable -ErrorAction SilentlyContinue | Select-Object -First 1).Version -lt [System.Version]$_.Version){
                $Null = Install-Module -Name $_.Module -MinimumVersion $_.Version -Force -AllowClobber -Repository PSGallery
                $Null = Remove-module -Name $_.Module -Force -WarningAction SilentlyContinue
                $Null = Import-module -Name $_.Module -MinimumVersion $_.Version -Force
            }else{
                $Null = Import-module -Name $_.Module -MinimumVersion $_.Version -Force
            }
        }
    }
    $Null = Import-PackageProvider -Name PowerShellGet -Force -MinimumVersion 2.2
    if ($CleanInstall) {
        Uninstall-Module -Name msp360 -AllVersions -ErrorAction SilentlyContinue
    } else {
        $LatestInstalledVersion = [System.Version](Get-InstalledModule -Name msp360 -ErrorAction SilentlyContinue).Version
        if ($LatestInstalledVersion) {
            if (($LatestInstalledVersion.Major -lt 2) -And ((-Not($RequiredVersion)) -Or ([System.Version]$RequiredVersion -ge [System.Version]'2.0.0'))) {
                Write-Warning -Message "Latest installed MSP360 PowerShell Module version is $($LatestInstalledVersion.ToString()). New version of the module is signed with an updated digital certificate. Uninstalling previous versions of the module before update..."
                Uninstall-Module -Name msp360 -AllVersions
            }
        }
    }
    $ModuleInstallOptions = @{
        Force = $true
    }
    if($RequiredVersion){
        $ModuleInstallOptions.Add("RequiredVersion",$RequiredVersion)
    }
    if($AllowAlpha){
        $ModuleInstallOptions.Add("AllowPrerelease",$true)
        Register-PSRepository -Name "MSP360" -SourceLocation "http://18.159.222.66/nuget/MSP360/" -InstallationPolicy Trusted
        $ModuleInstallOptions.Add("Repository","MSP360")
    }
    Install-Module -Name msp360 @ModuleInstallOptions
    Import-Module -Name msp360 -Force
}

