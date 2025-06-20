#region params

# Example of passing parameters: .\GetProductsInformationsFromFiles.ps1 -VerbosePreference Continue -enablePiiOutput
# This will make verbose level messages write to console and trigger results writing to console

param (
    [switch]$enablePiiOutput = $false,
    [string]$VerbosePreference = "SilentlyContinue"
 )

#endregion params
Get-Module | ForEach-Object { Remove-Module -Name $_.Name -Force }
$PSModuleAutoloadingPreference = 'none'

Import-Module Microsoft.PowerShell.Utility

$ScriptStartTime = Get-Date
write-host "Script start time $($ScriptStartTime.ToUniversalTime())"

#region output interface

$Source = @"
                        using System;
                        using System.Text;
                        using System.Diagnostics.Tracing;
                        using Microsoft.PowerShell.Commands;
                        public static class EtwProvider
                        {
                            public static EventSource log = new EventSource("Microsoft.Windows.Sense.CollectionEtw", EventSourceSettings.EtwSelfDescribingEventFormat);
                        }

                        [EventData]
                        public class FileProductMetadataEvent
                        {
							public string ExecPath { get; set; }  

							public string ProductVersion { get; set; } 

							public string ProductVendor { get; set; } 

                            public string ProductName { get; set; } 

							public string Source { get; set; } 
                        }

                        [EventData]
                        public class FileProductMetadataIndexingEvent
                        {
							public string ExecPaths { get; set;}
                        }
"@


#endregion output interface 

#region initialization

# init the event type

Add-Type -TypeDefinition $Source -Language CSharp -IgnoreWarnings
# load ZIP methods
Add-Type -AssemblyName System.IO.Compression.FileSystem
$etwProvider = [EtwProvider]::log
$dotnetRootCertificateThumbprint = "8F43288AD272F3103B6FB1428485EA3014C0BCFE"

$shell = New-Object -ComObject WScript.Shell
$isWmiDeprecated = (Get-Host).Version.Major -ge 3  # Get-WmiObject has been deprecated since pwsh
if ($isWmiDeprecated) {
    Set-Alias -Name Get-WmiObject -Value Get-CimInstance
}
# Regular expression to extract normal windows path of folders
# Examples:
# "C:\WINDOWS\system32\svchost.exe -k LocalSystemNetworkRestricted -p" -> "C:\WINDOWS\system32\svchost.exe"
# "C:\WINDOWS\System32\DriverStore\FileRepository\fn.inf_amd64_62cf4e1fc023f9a9\driver\TPHKLOAD.exe" -> "C:\WINDOWS\System32\DriverStore\FileRepository\fn.inf_amd64_62cf4e1fc023f9a9\driver\TPHKLOAD.exe"
# "\"C:\\Program Files\\Windows Defender Advanced Threat Protection\\MsSense.exe\"" -> "C:\Program Files\Windows Defender Advanced Threat Protection\MsSense.exe"
# "C:\Users\robelio\AppData\Local\Apps\2.0\G73TRZOM.2JK\XTXO8N1K.8JJ\kust..tion_a7cae1245bd53d87_0001.0000_984990bb36c1582d\Kusto.Explorer.exe.FriendlyAppName" -> "C:\Users\robelio\AppData\Local\Apps\2.0\G73TRZOM.2JK\XTXO8N1K.8JJ\kust..tion_a7cae1245bd53d87_0001.0000_984990bb36c1582d\Kusto.Explorer.exe"
$FolderRx = New-Object System.Text.RegularExpressions.Regex('([a-z]:\\(?:[^\/:*?\"<>|\r\n]+))\\',
    ([System.Text.RegularExpressions.RegexOptions]::Compiled -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase))

# Regex to extract MANIFEST.MF files
$ImpTitleRx = New-Object System.Text.RegularExpressions.Regex('Implementation-Title:.+?([^"\r\n]{1,200})', [System.Text.RegularExpressions.RegexOptions]::Compiled)
$SpecTitleRx = New-Object System.Text.RegularExpressions.Regex('Specification-Title:.+?([^"\r\n]{1,200})', [System.Text.RegularExpressions.RegexOptions]::Compiled)
$ImpVendorRx = New-Object System.Text.RegularExpressions.Regex('Implementation-Vendor:.+?([^"\r\n]{1,200})', [System.Text.RegularExpressions.RegexOptions]::Compiled)
$SpecVendorRx = New-Object System.Text.RegularExpressions.Regex('Specification-Vendor:.+?([^"\r\n]{1,200})', [System.Text.RegularExpressions.RegexOptions]::Compiled)
$ImpVersionRx = New-Object System.Text.RegularExpressions.Regex('Implementation-Version:.+?([^"\r\n]{1,200})', [System.Text.RegularExpressions.RegexOptions]::Compiled)
$SpecVersionRx = New-Object System.Text.RegularExpressions.Regex('Specification-Version:.+?([^"\r\n]{1,200})', [System.Text.RegularExpressions.RegexOptions]::Compiled)

# dotnet output regex
$dotnetSdkRx = New-Object System.Text.RegularExpressions.Regex('^([^\s]{1,200}) \[(.{1,200})\]', [System.Text.RegularExpressions.RegexOptions]::Compiled)
$dotnetRuntimeRx = New-Object System.Text.RegularExpressions.Regex('^Microsoft\.([^\s]{1,200}) ([^\s]{1,200}) \[(.{1,200})\]', ([System.Text.RegularExpressions.RegexOptions]::Compiled -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase))
$dotnetRuntimePathRx = New-Object System.Text.RegularExpressions.Regex('Microsoft\.([^\s\\]{1,200})\\(\d{1,4}\.\d{1,4}\.\d{1,6})', ([System.Text.RegularExpressions.RegexOptions]::Compiled -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase))
$dotnetSdkPathRx = New-Object System.Text.RegularExpressions.Regex('dotnet\\sdk\\(\d{1,4}\.\d{1,4}\.\d{1,6})', ([System.Text.RegularExpressions.RegexOptions]::Compiled -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase))

# version regex, takes only Major.Minor.Build
$VersionRx = New-Object System.Text.RegularExpressions.Regex('(.+?\..+?\.[\d\w]+)',
    ([System.Text.RegularExpressions.RegexOptions]::Compiled -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase))

# Folder patterns not scanned
$bannedFolders = @(
    ":\windows"
)

$bannedFileSuffixes = @(
    "Microsoft\Teams\current\Squirrel.exe",
	"Microsoft\Teams\Update.exe",
    "Microsoft VS Code\unins000.exe"
)

# Retrieval of Start Menues directory
try {
    $CommonStartMenu = [Environment]::GetFolderPath("CommonStartMenu")
    # Retrieval of *.lnk file from start menues
    $commonShortcuts = Get-ChildItem -LiteralPath $CommonStartMenu -Recurse -Filter *.lnk -ErrorAction SilentlyContinue
} catch {
    $commonShortcuts = @()
    Write-Verbose "Could not retrieve CommonStartMenu Path, Exception: $_"
}

try {
    $UsersStartMenu = Get-WmiObject win32_userprofile | Select-Object localpath | ForEach-Object { join-path $_.localpath "AppData\Roaming\Microsoft\Windows\Start Menu\Programs" }
    $usersShortcuts = Get-ChildItem -LiteralPath $UsersStartMenu -Recurse -Filter *.lnk -ErrorAction SilentlyContinue
}
catch {
    $usersShortcuts = @()
    Write-Verbose "Could not retrieve UserStartMenu Path, Exception: $_"
}

# Services WmiObject
try {
    if ($isWmiDeprecated) {
        $services = Get-WmiObject Win32_Service
    }
    else {
        $services = Get-WmiObject -EnableAllPrivileges Win32_Service
    }
    
}
catch {
    $services = @()
    Write-Verbose "Could not retrieve Services, Exception: $_"
}

# Initialization of data-structures
$folderScanner = @{}
$visitedBinaries = New-Object 'Collections.Generic.HashSet[string]'
$filesEvents = New-Object 'Collections.Generic.Dictionary[string, FileProductMetadataEvent]'
$filesPaths = New-Object System.Collections.Generic.HashSet[string]
$indexingEvent = New-Object FileProductMetadataIndexingEvent

#endregion initialization

#region logic

# Generate unique name per product for collision detection on $filesEvents Dictionary
function UniqueName($fileMetadata) {
	# Take version up to build (3rd value), for better aggregation of products.
	$versionMatch = $VersionRx.Match($fileMetadata.ProductVersion)
	$version = if ($versionMatch.Success) { $versionMatch.Groups[1].Value } else { $fileMetadata.ProductVersion }
    $m = select-string "\\users\\(.*?)\\" -inputobject $fileMetadata.ExecPath 
    $username = ""
    if ($null -ne $m) {
        $username = $m.matches.groups[1].value
    }

	return "$($fileMetadata.ProductName)-_-$($fileMetadata.ProductVendor)-_-$version-_-$username-"
}

function VerifyBinarySignature($filePath, $fileRootThumbprint) {
    Write-Host "Validating $filePath Certificate"
    $Authenticode = Get-AuthenticodeSignature $filePath
    if ($Authenticode.Status -ne "Valid" -or $null -eq $Authenticode.Status) {
        Write-Error "Failed to authenticate file"
        return $false
    }
    $chain = New-Object -TypeName System.Security.Cryptography.X509Certificates.X509Chain 
    if (-not $chain.Build($Authenticode.SignerCertificate)) {
        Write-Error "Failed to build certificate chain"
        return $false
    }

    $chainLength = $chain.ChainElements.Count
    $thumbprintMatch = ($chain.ChainElements[$chainLength - 1].Certificate.Thumbprint -eq $fileRootThumbprint)
    if (-not $thumbprintMatch) {
        Write-Error "Root Certificate Thumbprint mismatch: $($chain.ChainElements[$chainLength - 1].Certificate.Thumbprint) is not $($fileRootThumbprint)"
        return $false
    }
    return $true
}

# Go over all collected folders, scan them for matching files and retrieve full paths,
# Concatenate all collected sources from hashset to a comma delimited string
# Populate the fileEvents dictionary
function ExtractFilesFromCollectedFolders() {
    foreach ($folder in $folderScanner.Keys) {
        try {
            $execFiles = Get-ChildItem -LiteralPath $folder -File -Force -ErrorAction SilentlyContinue | Where-Object { '.exe' -eq $_.Extension }
            $jarFiles = Get-ChildItem -LiteralPath $folder -File -Force  -ErrorAction SilentlyContinue | Where-Object { ('.jar', '.war', '.ear') -contains $_.Extension}
            $sources = $folderScanner[$folder] -join ","  # values has hashet of sources
            PopulateFileEvents ${function:\GetExecMetadataFromPath} $execFiles $sources
            PopulateFileEvents ${function:\GetJARMetadataFromPath} $jarFiles $sources
        } catch {
            Write-Error "Failed to retrieve files from $folder."
            Write-Verbose "$_"
        }
    }
}

function isBannedFilePath($path) {
	foreach ($suffix in $bannedFileSuffixes) {
		if ($path -like "*$suffix") {
			return $true
		}
	}
	
	return $false
}

# Given a Metadata extraction function and the filepaths matching the extraction
# (.exe or .jar extraction), go over all file paths, extract metadata,
# attach sources string, compose a unique name,
# add to the fileEvents dictionary a key with unique name, and value of metadata
function PopulateFileEvents($function, $filePaths, $sources) {
    foreach ($filePath in $filePaths) {

		if (isBannedFilePath($filePath.FullName)) {
			continue
		}
		
        # Try to add the filepath to the visited list. If it returns falls, the item is already there and we don't need to check it again
        if (-not $visitedBinaries.Add($filePath.FullName))
        {
            continue
        }        
        
        try {
            $fileMetadata = Invoke-Command $function -ArgumentList $filePath.FullName, $sources
            if ($fileMetadata) {
                $uniqueName = UniqueName $fileMetadata
                if (-NOT $filesEvents.ContainsKey($uniqueName)) {
                    $filesEvents.Add($uniqueName, $fileMetadata)
                }
            } 
        } catch {
            # File can't be extract
            Write-Error "File $($filePath.FullName) excepted on extraction: $_"
        }
    }
}

# Get a raw string of paths, use regex to match all paths,
# Test for existence, normalize, get parent if path is a leaf
# Add to a [string]FolderPath->[Hashset<string>]Sources hashmap,
# create a hashset if needed
# ignore paths that are in the banned list of paths
function AddFolderScan($rawPath, $source) {
    $folders = ExtractRxForAllFolders $rawPath
    foreach ($folder in $folders) {
        if (Test-Path -LiteralPath $folder){
            $folder = [System.IO.Path]::GetFullPath($folder)  # normalizing paths like, ~,.,C:\PROGRA~3\
            if (Test-Path -LiteralPath $folder -PathType Leaf) {
                $folder = Split-Path $folder
            }
            # Check if entry exists and has a hashset as value, if entry exists then its not banned
            if ($folderScanner.ContainsKey($folder)) {
                $folderScanner[$folder].Add($source)
            }
            else {
                foreach ($bannedFolder in $bannedFolders) {
                    if (-NOT $folder.ToLower().Contains($bannedFolder)) {
                        $set = New-Object System.Collections.Generic.HashSet[string]
                        $set.Add($source)
                        $folderScanner[$folder] = $set
                    }
                }
            }
        }
    }
}

function ExtractDotNet()
{
    $dotnetFolderPath = $null
    try {
        $dotnetFolderPath = Split-Path (Get-Command dotnet).Path
    } catch {
        Write-Verbose "Dotnet tool not found, falling back to default path."
        $dotnetFolderPath = Join-Path $Env:Programfiles "dotnet"
    }

    $dotnetRuntimeFolderPath = Join-Path $dotnetFolderPath "shared"
    if (Test-Path -LiteralPath $dotnetRuntimeFolderPath) {
        $runtimePaths = Get-ChildItem -Path $dotnetRuntimeFolderPath -Filter ".version" -Recurse -ErrorAction Silent
        ForEach ($runtimePath in $runtimePaths) {
            $match = $dotnetRuntimePathRx.Match($runtimePath.FullName)
            if ($match.Success -AND $match.Groups[1].Success -AND $match.Groups[2].Success) {
                $fileMetadata = New-Object FileProductMetadataEvent;
                $fileMetadata.ExecPath = $runtimePath.FullName
                $fileMetadata.ProductVersion = $match.Groups[2].Value.Trim()
                $fileMetadata.ProductVendor = "Microsoft"
                $fileMetadata.ProductName = "$($match.Groups[1].Value.Trim())"
                $fileMetadata.Source = "Dotnet"
                $uniqueName = UniqueName $fileMetadata
                if (-NOT $filesEvents.ContainsKey($uniqueName)) {
                    $filesEvents.Add($uniqueName, $fileMetadata)
                }
            }
        }
    }

    $dotnetSdkFolderPath = Join-Path $dotnetFolderPath "sdk"
    if (Test-Path -LiteralPath $dotnetSdkFolderPath) {
        $sdkPaths = Get-ChildItem -Path $dotnetSdkFolderPath -Filter ".version" -Recurse -ErrorAction Silent
        ForEach ($sdkPath in $sdkPaths) {
            $match = $dotnetSdkPathRx.Match($sdkPath.FullName)
            if ($match.Success -AND $match.Groups[1].Success) {
                $fileMetadata = New-Object FileProductMetadataEvent;
                $fileMetadata.ExecPath = $sdkPath.FullName
                $fileMetadata.ProductVersion = $match.Groups[1].Value.Trim()
                $fileMetadata.ProductVendor = "Microsoft"
                $fileMetadata.ProductName = ".net_core_sdk"
                $fileMetadata.Source = "Dotnet"
                $uniqueName = UniqueName $fileMetadata
                if (-NOT $filesEvents.ContainsKey($uniqueName)) {
                    $filesEvents.Add($uniqueName, $fileMetadata)
                }
            }
        }
    }
}

# Extract only the manifest file from java archive file
# This file contains similar metadata to the one found on executables
function ExtractManifest($path) {
    try {
        # open ZIP archive for reading
        $zip = [System.IO.Compression.ZipFile]::OpenRead($path)

        $ze = $zip.GetEntry('META-INF/MANIFEST.MF')
        $reader = New-Object System.IO.StreamReader($ze.Open(), [System.Text.Encoding]::UTF8)
        $ret = $reader.ReadToEnd();

        $zip.Dispose() # close ZIP file
        return $ret
    } catch {
        Write-Verbose "JAR/WAR/EAR file error for path: $path, Exception: $_"
        return $null
    }
}

# Parse MANIFEST.MF file, Fail if ProductName or Vendor are missing
function GetJARMetadataFromPath($targetPath, $source) {
    if ((-NOT [string]::IsNullOrWhiteSpace($targetPath)) -And (Test-Path -LiteralPath $targetPath -PathType Leaf)) {
        $fileMetadata = New-Object FileProductMetadataEvent;
        $manifestData = ExtractManifest $targetPath 
        if (-NOT [string]::IsNullOrWhiteSpace($manifestData)) {
            $fileMetadata.ExecPath = $targetPath
            $fileMetadata.ProductVersion = (ExtractRxFromText $manifestData ($ImpVersionRx, $SpecVersionRx)).Trim()
            $fileMetadata.ProductVendor = (ExtractRxFromText $manifestData ($ImpVendorRx, $SpecVendorRx)).Trim()
            $fileMetadata.ProductName = (ExtractRxFromText $manifestData ($ImpTitleRx, $SpecTitleRx)).Trim()
            $fileMetadata.Source = $source

            if ([string]::IsNullOrEmpty($fileMetadata.ProductName) -Or [string]::IsNullOrEmpty($fileMetadata.ProductVendor)) {
                Write-Verbose "Cannot create a CollectedFile object from: $targetPath, vendor or title are missing"
                return $null
            } else {
                return $fileMetadata
            }
        }
    }
    # Empty path: ignore
    # Path is directory
    # Bad Manifest
    # Not supported file type
    return $null
}

# Get FileVersionInfo for executable, Fail if ProductName or Vendor are missing
function GetExecMetadataFromPath($targetPath, $source) {
    if ((-NOT [string]::IsNullOrWhiteSpace($targetPath)) -And (Test-Path -LiteralPath $targetPath -PathType Leaf)) {
        $fileMetadata = New-Object FileProductMetadataEvent;

        # Metadata 
        $versionInfo = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($targetPath)
        if ([string]::IsNullOrWhiteSpace($versionInfo.ProductName) -Or [string]::IsNullOrWhiteSpace($versionInfo.CompanyName)) {
            Write-Verbose "Cannot create a CollectedFile object from: $targetPath, vendor or title are missing"
            return $null
        }
        $fileMetadata.ExecPath = $targetPath
        # This null check allows us to send products without versions
        $fileMetadata.ProductVersion = if ($versionInfo.ProductVersion) { $versionInfo.ProductVersion.Trim() } else { [string]::Empty }

        $fileMetadata.ProductVendor = $versionInfo.CompanyName.Trim()
        $fileMetadata.ProductName = $versionInfo.ProductName.Trim()
        $fileMetadata.Source = $source

        return $fileMetadata
    } 
    # Empty path: ignore
    # Path is directory
    # Not supported file type
    return $null
}

# Iterates through Regular Expressions array,
# returning on the first regex match (greedy/lazy) that can be used to extract a MatchGroup from the text.
# Regex should have only 1 capture group
function ExtractRxFromText($text, [Regex[]]$regexArray) {
    if (-NOT [string]::IsNullOrWhiteSpace($text))
    {
        foreach ($regex in $regexArray)
        {
            $match = $regex.Match($text)
            if ($match.Success -AND $match.Groups[1].Success)
            {
                return $match.Groups[1].Value;
            }
        }
    }

    return [string]::Empty;
}

# Matches all Windows path like strings from a raw text
# return an ArrayList of all matches,
# important for parsing paths passed to executable as arguments
function ExtractRxForAllFolders($text) {
    [System.Collections.ArrayList]$folders = @()
    if (-NOT [string]::IsNullOrWhiteSpace($text)) {
        $match = $FolderRx.Match($text)
        while ($match.Success -AND $match.Groups[1].Success) {
            $null = $folders.Add($match.Groups[1].Value)
            $match = $match.NextMatch()
        }
    }
    return $folders
}

#region Getting events
foreach ($shortcut in $commonShortcuts) {
    try { 
        $target = $shell.CreateShortcut($shortcut.FullName)
        $null = AddFolderScan $target.TargetPath "CommonShortcuts"
        # Taking arguments as well for java.exe -jar scenarios
        $null = AddFolderScan $target.Arguments "CommonShortcuts"
    }
    catch {
        Write-Error "An error getting exectuables metadata for common shortcuts." -TargetObject $shortcut
    }
}

foreach ($shortcut in $usersShortcuts) {
    try {
        $target = $shell.CreateShortcut($shortcut.FullName)
        $null = AddFolderScan $target.TargetPath "UsersShortucts"
        $null = AddFolderScan $target.Arguments "UsersShortucts"
		$null = AddFolderScan "$($target.WorkingDirectory)\dummy.exe" "UsersShortucts"
		if ($shortcut.Name -like "Microsoft Teams*.lnk") {
            $teamsPath = join-path $target.WorkingDirectory "current\teams.exe"
			$null = AddFolderScan $teamsPath "UsersShortucts"
		}
    }
    catch {
        Write-Error "An error getting exectuables metadata for user shortcuts." -TargetObject $shortcut
    }
}

try {
    # Iterate over services from the WMI-object, extract path name
    foreach ($service in $services) {
        $null = AddFolderScan $service.PathName "Services"
    }
} catch {
    Write-Error "An error reading services WMIObject. Exception: $_"
}

#endregion Getting events

#Extracting DotNet runtimes and sdks
$extractDotNetResult = ExtractDotNet

#region folder pass without duplicates
ExtractFilesFromCollectedFolders
# filesEvents and filePaths are now populated without duplicates
#endregion folder pass without duplicates

#endregion logic


#region firing the events

foreach ($evt in $filesEvents.Values) {
    $etwProvider.Write("FileProductMetadataEvent", $evt)  

    $null = $filesPaths.Add($evt.ExecPath)
}

$indexingEvent.ExecPaths = ConvertTo-Json $filesPaths -Compress
$etwProvider.Write("FileProductMetadataIndexingEvent", $indexingEvent) 

if ($enablePiiOutput) 
{
    Write-Output $filesEvents | Format-Table -Wrap -Property @{ Name = "Product-Vendor-Version Tuple"; Expression = { $_.Key } }, @{ Name = "Sources"; Expression = { $_.Value.Source } }, @{ Name = "Path"; Expression = { $_.Value.ExecPath } }
    Write-Output "Total Collected: $($filesEvents.Count)"
}

#endregion firing the events

try {
    # Print script execution time
	$ScriptEndTime = Get-Date
	$diff = New-TimeSpan -Start $ScriptStartTime -End $ScriptEndTime
	Write-Host "Script elapsed $($diff.TotalSeconds) seconds"
} catch {
    Write-Error "Failed getting script elapsed time"
}

# SIG # Begin signature block
# MIIoZAYJKoZIhvcNAQcCoIIoVTCCKFECAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDSHA+CXd7GfC5g
# fXkE/AplWOjjmgQ/8jhJErycXS0ZyqCCDZcwggYVMIID/aADAgECAhMzAAAEOExw
# F8dThPTzAAAAAAQ4MA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjQxMTE1MDAwMTIzWhcNMjUxMTEzMDAwMTIzWjCBlDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE+MDwGA1UEAxM1TWlj
# cm9zb2Z0IFdpbmRvd3MgRGVmZW5kZXIgQWR2YW5jZWQgVGhyZWF0IFByb3RlY3Rp
# b24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC7XRtbYKag9kcj7xkU
# ngKJasJqOoGURz5mjsXKDgxWbKkHzjZn2dUlQetNwLN3RrR/2rrNhGM4Vour57xq
# L6MijWd6HfBkGZAl/h3ALhPLrertldZ0FhEzt/kLSsbx/2xq5Vwlt7RkRzwJSoeO
# 4jnXQUaG+dAb9mQW87vtDEARcKJqTTGB5W685hOyg4FWkb1nGPc4WgYE53Ri2XZv
# cCvuCsz5JmIbPjoQQHKomxaAr+wuea7o+r0M/bbm2Ok8v9LcX9bGx1ch515nXVkK
# PfCDQQbJ27pOlEEVOuu9WOHqs5zDCRO5Q4u6VrO/Q9+YF0snySMgsSJQ04BMeKDz
# uoHdAgMBAAGjggFzMIIBbzAfBgNVHSUEGDAWBggrBgEFBQcDAwYKKwYBBAGCN0wv
# ATAdBgNVHQ4EFgQU02W11Adr5UTyXh234s3aOhbYszEwRQYDVR0RBD4wPKQ6MDgx
# HjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEWMBQGA1UEBRMNNDUxODk0
# KzUwMzM3MzAfBgNVHSMEGDAWgBRIbmTlUAXTgqoXNzcitW2oynUClTBUBgNVHR8E
# TTBLMEmgR6BFhkNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9N
# aWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3JsMGEGCCsGAQUFBwEBBFUwUzBR
# BggrBgEFBQcwAoZFaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0
# cy9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3J0MAwGA1UdEwEB/wQCMAAw
# DQYJKoZIhvcNAQELBQADggIBAJFkkzz+21rdOP2DeayTmrKJr3DK/NC2aKa+1TSl
# vaOVCWsqb1pcyqeLzUzCBuNCww5re19s/OESbO65iY3Ky7LquPeI8ZLWPugu8YRm
# 3s3rubr7d+GE0sx8NsOrkl4rfMpcweJ4grwFgrbvXDWEXvZBINlon7UIRsXB+oRH
# astYgbi5mV/1Y5s48vRHaErdlfJVPuyZ3cINFUM/FWMC2pQT17Qsc+76VR0JBC3W
# EHbj6bMkwNJ2881VAthRw2HuR+VSeDo4Qye+WDoq8YGo0wP1futayOCtQKv8ss8E
# E+PhNJhbojtwxKkrj4OspfPcUuna2bl0XFYWmMcK7Nd8ZF/yXEhOm1XQ+34d6KuA
# L3PvUm91X7Dp40jwMj1hMdpGi/p+SAOwzmeYMUw9+ZSaqrPDnDENSiiHCLayYN+E
# 3GMyo2Ha46Dhoop3jWnfMeTOIuY8hL5qiMeRg2WVHT3Y00UKThBnNo3XEf4zmpnx
# J4y/KDP+ntELIl52LLEQL5rzsGum6YRNxhySKbiimX9aj3zUFryeMk9WPgI1ACVG
# tflE5jeQ27eyOhdkwwYTOftQMhknSLXRbKe3q9FOraeYuORsBsyP+G29bnKPIZcs
# MkjsXy3N6HmJV/HYryosl9aaPejoITRumEuhwtt9zcVuCKwg/UY8nA2elYn6mwss
# 4NoRMIIHejCCBWKgAwIBAgIKYQ6Q0gAAAAAAAzANBgkqhkiG9w0BAQsFADCBiDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWlj
# cm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTEwHhcNMTEwNzA4
# MjA1OTA5WhcNMjYwNzA4MjEwOTA5WjB+MQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBTaWduaW5nIFBD
# QSAyMDExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAq/D6chAcLq3Y
# bqqCEE00uvK2WCGfQhsqa+laUKq4BjgaBEm6f8MMHt03a8YS2AvwOMKZBrDIOdUB
# FDFC04kNeWSHfpRgJGyvnkmc6Whe0t+bU7IKLMOv2akrrnoJr9eWWcpgGgXpZnbo
# MlImEi/nqwhQz7NEt13YxC4Ddato88tt8zpcoRb0RrrgOGSsbmQ1eKagYw8t00CT
# +OPeBw3VXHmlSSnnDb6gE3e+lD3v++MrWhAfTVYoonpy4BI6t0le2O3tQ5GD2Xuy
# e4Yb2T6xjF3oiU+EGvKhL1nkkDstrjNYxbc+/jLTswM9sbKvkjh+0p2ALPVOVpEh
# NSXDOW5kf1O6nA+tGSOEy/S6A4aN91/w0FK/jJSHvMAhdCVfGCi2zCcoOCWYOUo2
# z3yxkq4cI6epZuxhH2rhKEmdX4jiJV3TIUs+UsS1Vz8kA/DRelsv1SPjcF0PUUZ3
# s/gA4bysAoJf28AVs70b1FVL5zmhD+kjSbwYuER8ReTBw3J64HLnJN+/RpnF78Ic
# V9uDjexNSTCnq47f7Fufr/zdsGbiwZeBe+3W7UvnSSmnEyimp31ngOaKYnhfsi+E
# 11ecXL93KCjx7W3DKI8sj0A3T8HhhUSJxAlMxdSlQy90lfdu+HggWCwTXWCVmj5P
# M4TasIgX3p5O9JawvEagbJjS4NaIjAsCAwEAAaOCAe0wggHpMBAGCSsGAQQBgjcV
# AQQDAgEAMB0GA1UdDgQWBBRIbmTlUAXTgqoXNzcitW2oynUClTAZBgkrBgEEAYI3
# FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAf
# BgNVHSMEGDAWgBRyLToCMZBDuRQFTuHqp8cx0SOJNDBaBgNVHR8EUzBRME+gTaBL
# hklodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNS
# b29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3JsMF4GCCsGAQUFBwEBBFIwUDBOBggr
# BgEFBQcwAoZCaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNS
# b29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3J0MIGfBgNVHSAEgZcwgZQwgZEGCSsG
# AQQBgjcuAzCBgzA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9kb2NzL3ByaW1hcnljcHMuaHRtMEAGCCsGAQUFBwICMDQeMiAdAEwA
# ZQBnAGEAbABfAHAAbwBsAGkAYwB5AF8AcwB0AGEAdABlAG0AZQBuAHQALiAdMA0G
# CSqGSIb3DQEBCwUAA4ICAQBn8oalmOBUeRou09h0ZyKbC5YR4WOSmUKWfdJ5DJDB
# ZV8uLD74w3LRbYP+vj/oCso7v0epo/Np22O/IjWll11lhJB9i0ZQVdgMknzSGksc
# 8zxCi1LQsP1r4z4HLimb5j0bpdS1HXeUOeLpZMlEPXh6I/MTfaaQdION9MsmAkYq
# wooQu6SpBQyb7Wj6aC6VoCo/KmtYSWMfCWluWpiW5IP0wI/zRive/DvQvTXvbiWu
# 5a8n7dDd8w6vmSiXmE0OPQvyCInWH8MyGOLwxS3OW560STkKxgrCxq2u5bLZ2xWI
# UUVYODJxJxp/sfQn+N4sOiBpmLJZiWhub6e3dMNABQamASooPoI/E01mC8CzTfXh
# j38cbxV9Rad25UAqZaPDXVJihsMdYzaXht/a8/jyFqGaJ+HNpZfQ7l1jQeNbB5yH
# PgZ3BtEGsXUfFL5hYbXw3MYbBL7fQccOKO7eZS/sl/ahXJbYANahRr1Z85elCUtI
# EJmAH9AAKcWxm6U/RXceNcbSoqKfenoi+kiVH6v7RyOA9Z74v2u3S5fi63V4Guzq
# N5l5GEv/1rMjaHXmr/r8i+sLgOppO6/8MO0ETI7f33VtY5E90Z1WTk+/gFcioXgR
# MiF670EKsT/7qMykXcGhiJtXcVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQ
# zTGCGiMwghofAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEC
# EzMAAAQ4THAXx1OE9PMAAAAABDgwDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcN
# AQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUw
# LwYJKoZIhvcNAQkEMSIEIMy4ayEG/BRwMfivyQOONpR+c9/wUsd67FlkTDI4ai2y
# MEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEArj38XciHRTdF
# PgmwrVA++HokEDamPxVjVdz4Y8kCRTXawudxSJmox0qwH//usmaWAMNVC2hevffN
# xwLQMZzkawd3RoyN+rMSy65UnwRP3kDYmzOWcW4y7nTb5JdP9c4l7CL6LoTwDDwO
# GOmUcHx9nIFpXNdFEPktKgPkebdx+ecImG4w4zkQGggM22/ymVpFJzwHxLRmqrFk
# wc+I71xvOv6T0T6eX6PvMPJC1OEvbun/1dxPaevDJAQTeu39MHX27+G0lKGwdqmH
# s5z63EnhgHYa3b8C4wofxd+z5TbqfpPUfRa4rcqz+MOagYEENOxRbTRuGhmGF5zm
# E88iyUx1gqGCF60wghepBgorBgEEAYI3AwMBMYIXmTCCF5UGCSqGSIb3DQEHAqCC
# F4YwgheCAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkE
# ggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQCAQUABCBI0d1oa4yX
# 4oiguCyCM8CO+/AFfWq/0lHXIdIrbKkdkAIGaC4aRWZiGBMyMDI1MDYwNTE0NDI0
# MS4zMzdaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo0MzFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCEfswggco
# MIIFEKADAgECAhMzAAAB+vs7RNN3M8bTAAEAAAH6MA0GCSqGSIb3DQEBCwUAMHwx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1p
# Y3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTI0MDcyNTE4MzExMVoXDTI1
# MTAyMjE4MzExMVowgdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjQzMUEtMDVFMC1EOTQ3MSUwIwYD
# VQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEAyhZVBM3PZcBfEpAf7fIIhygwYVVP64USeZbSlRR3
# pvJebva0LQCDW45yOrtpwIpGyDGX+EbCbHhS5Td4J0Ylc83ztLEbbQD7M6kqR0Xj
# +n82cGse/QnMH0WRZLnwggJdenpQ6UciM4nMYZvdQjybA4qejOe9Y073JlXv3VIb
# dkQH2JGyT8oB/LsvPL/kAnJ45oQIp7Sx57RPQ/0O6qayJ2SJrwcjA8auMdAnZKOi
# xFlzoooh7SyycI7BENHTpkVKrRV5YelRvWNTg1pH4EC2KO2bxsBN23btMeTvZFie
# GIr+D8mf1lQQs0Ht/tMOVdah14t7Yk+xl5P4Tw3xfAGgHsvsa6ugrxwmKTTX1kqX
# H5XCdw3TVeKCax6JV+ygM5i1NroJKwBCW11Pwi0z/ki90ZeO6XfEE9mCnJm76Qcx
# i3tnW/Y/3ZumKQ6X/iVIJo7Lk0Z/pATRwAINqwdvzpdtX2hOJib4GR8is2bpKks0
# 4GurfweWPn9z6jY7GBC+js8pSwGewrffwgAbNKm82ZDFvqBGQQVJwIHSXpjkS+G3
# 9eyYOG2rcILBIDlzUzMFFJbNh5tDv3GeJ3EKvC4vNSAxtGfaG/mQhK43YjevsB72
# LouU78rxtNhuMXSzaHq5fFiG3zcsYHaa4+w+YmMrhTEzD4SAish35BjoXP1P1Ct4
# Va0CAwEAAaOCAUkwggFFMB0GA1UdDgQWBBRjjHKbL5WV6kd06KocQHphK9U/vzAf
# BgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQ
# hk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQl
# MjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBe
# MFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2Nl
# cnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAM
# BgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQE
# AwIHgDANBgkqhkiG9w0BAQsFAAOCAgEAuFbCorFrvodG+ZNJH3Y+Nz5QpUytQVOb
# OyYFrgcGrxq6MUa4yLmxN4xWdL1kygaW5BOZ3xBlPY7Vpuf5b5eaXP7qRq61xeOr
# X3f64kGiSWoRi9EJawJWCzJfUQRThDL4zxI2pYc1wnPp7Q695bHqwZ02eaOBudh/
# IfEkGe0Ofj6IS3oyZsJP1yatcm4kBqIH6db1+weM4q46NhAfAf070zF6F+IpUHyh
# tMbQg5+QHfOuyBzrt67CiMJSKcJ3nMVyfNlnv6yvttYzLK3wS+0QwJUibLYJMI6F
# GcSuRxKlq6RjOhK9L3QOjh0VCM11rHM11ZmN0euJbbBCVfQEufOLNkG88MFCUNE1
# 0SSbM/Og/CbTko0M5wbVvQJ6CqLKjtHSoeoAGPeeX24f5cPYyTcKlbM6LoUdO2P5
# JSdI5s1JF/On6LiUT50adpRstZajbYEeX/N7RvSbkn0djD3BvT2Of3Wf9gIeaQIH
# bv1J2O/P5QOPQiVo8+0AKm6M0TKOduihhKxAt/6Yyk17Fv3RIdjT6wiL2qRIEsgO
# Jp3fILw4mQRPu3spRfakSoQe5N0e4HWFf8WW2ZL0+c83Qzh3VtEPI6Y2e2BO/eWh
# TYbIbHpqYDfAtAYtaYIde87ZymXG3MO2wUjhL9HvSQzjoquq+OoUmvfBUcB2e5L6
# QCHO6qTO7WowggdxMIIFWaADAgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqG
# SIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkg
# MjAxMDAeFw0yMTA5MzAxODIyMjVaFw0zMDA5MzAxODMyMjVaMHwxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBU
# aW1lLVN0YW1wIFBDQSAyMDEwMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
# AgEA5OGmTOe0ciELeaLL1yR5vQ7VgtP97pwHB9KpbE51yMo1V/YBf2xK4OK9uT4X
# YDP/XE/HZveVU3Fa4n5KWv64NmeFRiMMtY0Tz3cywBAY6GB9alKDRLemjkZrBxTz
# xXb1hlDcwUTIcVxRMTegCjhuje3XD9gmU3w5YQJ6xKr9cmmvHaus9ja+NSZk2pg7
# uhp7M62AW36MEBydUv626GIl3GoPz130/o5Tz9bshVZN7928jaTjkY+yOSxRnOlw
# aQ3KNi1wjjHINSi947SHJMPgyY9+tVSP3PoFVZhtaDuaRr3tpK56KTesy+uDRedG
# bsoy1cCGMFxPLOJiss254o2I5JasAUq7vnGpF1tnYN74kpEeHT39IM9zfUGaRnXN
# xF803RKJ1v2lIH1+/NmeRd+2ci/bfV+AutuqfjbsNkz2K26oElHovwUDo9Fzpk03
# dJQcNIIP8BDyt0cY7afomXw/TNuvXsLz1dhzPUNOwTM5TI4CvEJoLhDqhFFG4tG9
# ahhaYQFzymeiXtcodgLiMxhy16cg8ML6EgrXY28MyTZki1ugpoMhXV8wdJGUlNi5
# UPkLiWHzNgY1GIRH29wb0f2y1BzFa/ZcUlFdEtsluq9QBXpsxREdcu+N+VLEhReT
# wDwV2xo3xwgVGD94q0W29R6HXtqPnhZyacaue7e3PmriLq0CAwEAAaOCAd0wggHZ
# MBIGCSsGAQQBgjcVAQQFAgMBAAEwIwYJKwYBBAGCNxUCBBYEFCqnUv5kxJq+gpE8
# RjUpzxD/LwTuMB0GA1UdDgQWBBSfpxVdAF5iXYP05dJlpxtTNRnpcjBcBgNVHSAE
# VTBTMFEGDCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wEwYDVR0lBAww
# CgYIKwYBBQUHAwgwGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQD
# AgGGMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAU1fZWy4/oolxiaNE9lJBb
# 186aGMQwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29t
# L3BraS9jcmwvcHJvZHVjdHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3JsMFoG
# CCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcnQwDQYJKoZI
# hvcNAQELBQADggIBAJ1VffwqreEsH2cBMSRb4Z5yS/ypb+pcFLY+TkdkeLEGk5c9
# MTO1OdfCcTY/2mRsfNB1OW27DzHkwo/7bNGhlBgi7ulmZzpTTd2YurYeeNg2Lpyp
# glYAA7AFvonoaeC6Ce5732pvvinLbtg/SHUB2RjebYIM9W0jVOR4U3UkV7ndn/OO
# PcbzaN9l9qRWqveVtihVJ9AkvUCgvxm2EhIRXT0n4ECWOKz3+SmJw7wXsFSFQrP8
# DJ6LGYnn8AtqgcKBGUIZUnWKNsIdw2FzLixre24/LAl4FOmRsqlb30mjdAy87JGA
# 0j3mSj5mO0+7hvoyGtmW9I/2kQH2zsZ0/fZMcm8Qq3UwxTSwethQ/gpY3UA8x1Rt
# nWN0SCyxTkctwRQEcb9k+SS+c23Kjgm9swFXSVRk2XPXfx5bRAGOWhmRaw2fpCjc
# ZxkoJLo4S5pu+yFUa2pFEUep8beuyOiJXk+d0tBMdrVXVAmxaQFEfnyhYWxz/gq7
# 7EFmPWn9y8FBSX5+k77L+DvktxW/tM4+pTFRhLy/AsGConsXHRWJjXD+57XQKBqJ
# C4822rpM+Zv/Cuk0+CQ1ZyvgDbjmjJnW4SLq8CdCPSWU5nR0W2rRnj7tfqAxM328
# y+l7vzhwRNGQ8cirOoo6CGJ/2XBjU02N7oJtpQUQwXEGahC0HVUzWLOhcGbyoYID
# VjCCAj4CAQEwggEBoYHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo0MzFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcG
# BSsOAwIaAxUA94Z+bUJn+nKwBvII6sg0Ny7aPDaggYMwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsFAAIFAOvrtRAwIhgPMjAy
# NTA2MDUwNjE3NTJaGA8yMDI1MDYwNjA2MTc1MlowdDA6BgorBgEEAYRZCgQBMSww
# KjAKAgUA6+u1EAIBADAHAgEAAgIcRDAHAgEAAgIVETAKAgUA6+0GkAIBADA2Bgor
# BgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAID
# AYagMA0GCSqGSIb3DQEBCwUAA4IBAQBHDGeTgC/sEe+XoDeE8KtG9PyOFYCcmKtF
# zDcEFgtqe+8duI0S35gaCC+865crp3eAQu/LOeRAPdu/8pNNzfFQSkSaDf/g0QeJ
# a3GBmnOlcWCDZhZQDha2zNLXR3B60G9fpKZr8y4R/dF1w4xSLvI3SdXSuzHO3bUv
# uAqTHNkA4Lt2F02Ac4VFL46uBrP/QeKLaN8rmj0zehgYI/N0J8KjA30Xdq3UlUtK
# 3UYTUvYgLdMpsCZwABfyRCz/o4SPMUPkE8cEk7SS03anVC+t99mtk4LP9IDtGaHj
# vtXJWEj3zpYjESsX3EBD0GtTI3B4htkxPmgaf69j00WPvbChrYTJMYIEDTCCBAkC
# AQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQG
# A1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAH6+ztE03cz
# xtMAAQAAAfowDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG
# 9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQghacYnPMgealMPk8PjkMLridPbl4kWnbp
# x2WhoahRbgIwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCB98n8tya8+B2jj
# U/dpJRIwHwHHpco5ogNStYocbkOeVjCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0
# YW1wIFBDQSAyMDEwAhMzAAAB+vs7RNN3M8bTAAEAAAH6MCIEIPhiCG7E7XDOJVFw
# kHZk353OIrLpKEe9ZNSinWy7kMRmMA0GCSqGSIb3DQEBCwUABIICAKHWs+/pAOz0
# +eVIe/xsgl6LI9CSVFWckQMUlHsDDmMXT7+vOdMDjwFpS1IxQ67zk5aAPk85wsbT
# oYi9tY0/Kz3HPGY1CMHEDoAF/1lKyIP2p714GDzUOh/EUCHMWlHmKVHqObBiZr6l
# 3SqwRG5okvcO1cnfCz83kGncSfs1XC/EKWQS31Bwy4zl6sYOMk+11fqyhmGzfyra
# 6ZIbMM53fRfo7KXNn1+2J/jVT8WK74KwPUF5iDdz1aIBa3o70JtoOdUIB7ok7GAN
# o44CYph7C/EzlNplKLXHVeSDiPPcrhK8s342GbhoxhPDw9fRk+a399GuqnO5dB7Z
# vAk+BnMUgHe2pcmiMlKvIsl9Za9JXE9q2hjxLzmhYGoCiqByQZgX1tWI4Y3tNQEi
# FCKBT92KQQvgDK+fcgMM34nzGQVPFhrDT2mY1J9Ec6TmJ2ZKBBoKQY1jXqmeRfpf
# eimt7UyAhzilC2wQlD/+xxbkjyxzcfuYISxbeTLcAbuBvUv/XfuIlVQhZKz7qZmh
# WRIv1CQH76O61abt87S8JUrNZQ+5TEcNFd++Lkd42HXOUmeb+WRBVU9yvuXx5tuC
# bd3ik5J7jMCyXLS659S9dG9ZpvxVXGngQ49tVcU2pOcVoBBDDAT4f89oEaBqJycB
# IjOybG/X8ZqJj/E9NwuOS0/QOM9QqeZb
# SIG # End signature block
