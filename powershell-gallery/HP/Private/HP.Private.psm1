#
#  Copyright 2018-2025 HP Development Company, L.P.
#  All Rights Reserved.
#
# NOTICE:  All information contained herein is, and remains the property of HP Development Company, L.P.
#
# The intellectual and technical concepts contained herein are proprietary to HP Development Company, L.P
# and may be covered by U.S. and Foreign Patents, patents in process, and are protected by
# trade secret or copyright law. Dissemination of this information or reproduction of this material
# is strictly forbidden unless prior written permission is obtained from HP Development Company, L.P.

using namespace HP.CMSLHelper

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 3.0

# CMSL is normally installed in C:\Program Files\WindowsPowerShell\Modules
# but if installed via PSGallery and via PS7, it is installed in a different location
if(Test-Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll") {
  Add-Type -Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll"
}
else {
  Add-Type -Path "$PSScriptRoot\HP.CMSLHelper.dll"
}

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateReadINI {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $True)] $file,
    [Parameter(Mandatory = $False)] [int]$maxRetries = 0
  )

  Write-Verbose "Reading INI style file '$file'"
  [System.IO.StreamReader]$streamReader = $null
  $CommentCount = 0
  $name = $null

  # only allow https or file paths with or without file:// URL prefix
  if ($file -and -not ($file.StartsWith("https://",$true,$null) -or [System.IO.File]::Exists($file) -or $file.StartsWith("file://",$true,$null))) {
    throw [System.ArgumentException]"Only HTTPS or valid existing file paths are supported."
  }


  # if file starts with file:// or file:/// or file:////, remove the file URL prefix to just use the actual file path
  if ($file.StartsWith("file://",$true,$null)) {
    $file = $file.Substring(7)
  }

  # remove any leading forward slashes
  $file = $file.TrimStart("/")

  try {
    if ($file.StartsWith("https://",$true,$null)) {
      Write-Verbose ("Reading network file: $file")

      [int]$retries = $maxRetries
      do {
        try {
          Write-Verbose "Downloading CVA file $file, try $($maxRetries-$retries) / $maxRetries"
          [System.Net.ServicePointManager]::SecurityProtocol = Get-HPPrivateAllowedHttpsProtocols
          $userAgent = Get-HPPrivateUserAgent
          $data = Invoke-WebRequest -Uri $file -UserAgent $userAgent -UseBasicParsing -ErrorAction Stop
          $retries = 0
        }
        catch {
          $retries = $retries - 1
          Write-Verbose ("Download failed: $($_.Exception)")
          if ($retries -le 0) { throw $_ }
          Start-Sleep 5

        }
      } while ($retries -gt 0)

      $streamReader = New-Object System.IO.StreamReader ($data.RawContentStream)
    }
    else {
      Write-Verbose ("Reading filesystem file: $file")
      $streamReader = New-Object -TypeName System.IO.StreamReader -ArgumentList $file
    }

    $ini = @{}
    while (($line = $streamReader.ReadLine()) -ne $null) {
      switch -regex ($line) {
        "^\[(.+)\]$" {
          # Section
          $section = $matches[1]
          $ini[$section] = @{}
          $CommentCount = 0
        }
        "^(;.*)$" {
          # Comment
          if (!(Test-Path variable:\section)) {
            $section = "No-Section"
            $ini[$section] = @{}
          }
          $value = $matches[1]
          $CommentCount = $CommentCount + 1
          $name = "Comment" + $CommentCount
          $ini[$section][$name] = $value
        }
        "(.+?)\s*=\s*(.*)" {
          # Key
          if (!($section)) {
            $section = "No-Section"
            $ini[$section] = @{}
          }
          $name,$value = $matches[1..2]
          if ($ini[$section][$name]) {
            if ($ini[$section][$name] -is [string]) {
              $ini[$section][$name] = @($ini[$section][$name])
            }
            $ini[$section][$name] += $value
          }
          else {
            $ini[$section][$name] = $value
          }
          continue
        }
        "^(?!(.*[=])).*" {
          # section text block
          if (!($section)) {
            $section = "No-Section"
            $ini[$section] = @{}
          }

          if ($ini[$section]["_body"] -eq $null) {
            $ini[$section]["_body"] = @()
          }

          $ini[$section]["_body"] += ($matches.Values | Where-Object { $_.StartsWith("[") -eq $false })
        }
      }
    }
  }
  finally {
    if ($streamReader) {
      $streamReader.Close()
      $streamReader.Dispose()
      $streamReader = $null
    }
  }
  return $ini
}




# this is what the downloaded filename will be

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateTemporaryFileName ($filename,[System.IO.DirectoryInfo]$cacheDir = [System.IO.Path]::GetTempPath() + "hp") {
  $cacheDir = Join-Path -Path $cacheDir -ChildPath $filename
  $cacheDir.FullName
}




<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function GetHPLockedStreamForWrite {
  [CmdletBinding()]
  [Alias('GetLockedStreamForWrite')]
  param([string]$target,[int]$maxRetries = 10)

  Write-Verbose "Opening exclusive access to file $target with maximum retries of $maxRetries"
  $lock_wait = $false

  do {
    try {
      $lock_wait = $false
      $result = New-Object -TypeName System.IO.FileStream -ArgumentList $target,Create,Write,None
    }
    catch {
      Write-Verbose ("*******  $($_ | fl)")
      $lock_wait = $true
      if ($maxRetries -gt 0) {
        Start-Sleep -Seconds 30
        $maxRetries = $maxRetries - 1
      }
      else {
        throw "Could not obtain exclusive access to file '$target' and all retries were exhausted."
      }

    }
  }
  while ($lock_wait -eq $true)
  $result
}

# check for collision with other processes

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function GetHPSharedFileInformation {
  [CmdletBinding()]
  [Alias('GetSharedFileInformation')]
  param($file,[string]$mode,[switch]$wait,[int]$maxRetries,[switch]$progress,[switch]$skipSignatureCheck)

  $return = $true
  $length = 0
  $sig = $false

  Write-Verbose ("Getting file information for file $file with access rights=$mode, wait = $wait, maxRetries=$maxRetries, skipAuthenticode=$($skipSignatureCheck.IsPresent)")
  if (-not $wait.IsPresent) {
    Write-Verbose ("This operation will not be retried.")
    $maxRetries = 0
  }

  do {
    # file length
    try {
      $length = (Get-ChildItem -File $file -ErrorAction Stop).Length
    }
    catch {
      Write-Verbose "Caught exception: $_.Message"
      return (-1,$true,$skipSignatureCheck.IsPresent)
    }

    Write-Verbose ("Target file length on disk is $length bytes")
    try {
      $fs = [System.IO.File]::Open($file,"Open",$mode)
      $return = $true
      $fs.Close()
      $fs.Dispose()
      Write-Verbose "Able to read from file '$file', it doesn't seem locked."


      if ($skipSignatureCheck.IsPresent) {
        Write-Verbose "Not checking Authenticode signature for file $file"
        $sig = $true
      }
      else {
        $sig = Get-HPPrivateCheckSignature -File $file -Progress:$progress
      }
      break
    }
    catch [System.IO.FileNotFoundException]{
      Write-Verbose "File not found: $_.Message"
      return (-1,$true,$skipSignatureCheck.IsPresent)
    }
    catch {
      Write-Verbose "Internal error: $_.Message"
      $return = $false
      if ($maxRetries -gt 0) {
        if ($progress) {
          Write-Progress -Activity "Blocked by another process, will retry for ($maxRetries) tries"
        }

        Write-Verbose ("Sleeping for 30 seconds since someone else has '$file' locked")
        Start-Sleep -Seconds 30
        Write-Verbose ("Woke up")
      }
      $maxRetries = $maxRetries - 1
    }
  } while ($maxRetries -gt 0)
  ($length,$return,$sig)
}


# download a file

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Invoke-HPPrivateDownloadFile {
  [CmdletBinding()]
  param
  (
    [string]$url,
    [string]$target,
    [bool]$progress,
    [string]$noclobber,
    [switch]$panic,
    [int]$maxRetries = 0,
    [switch]$skipSignatureCheck
  )

  Write-Verbose ("Requesting to download $url to $target with progress: $progress and signatureCheckSkip: $skipSignatureCheck")
  [System.Net.ServicePointManager]::SecurityProtocol = Get-HPPrivateAllowedHttpsProtocols
  $userAgent = Get-HPPrivateUserAgent
  $targetStream = $null
  $responseStream = $null
  $response = $null

  try {
    if (Test-Path $target -PathType Leaf) {
      # target file exists
      switch ($noclobber) {
        "no" {
          if ($panic.IsPresent) { throw "File $target already exists, will not overwrite." }

          if ($progress) { Write-Host -ForegroundColor Magenta "File $target already exists, will not overwrite." }
          return
        }
        "yes" {
          if ($progress -eq $true) { Write-Verbose "Overwriting existing file $target" }
        }
        "skip" {}
      }

    }
    else {
      #create lead directory if needed
      $lead = Split-Path $target
      if (!(Test-Path $lead)) {
        Write-Verbose "Creating directory '$lead'"
        $leaf = Split-Path $lead -leaf
        New-Item -ItemType Directory -Force -Path $lead.TrimEnd($leaf) -Name $leaf | Out-Null
      }
    }

    $uri = New-Object "System.Uri" "$url"
    $retries = $maxRetries

    do {
      $request = [System.Net.HttpWebRequest]::Create($uri)
      $request.set_Timeout(60000)

      if ($request -is [System.Net.HttpWebRequest]){
        Write-Verbose "Setting user agent $userAgent in HttpWebRequest"
        $request.UserAgent = $userAgent
      }

      try {
        Write-Verbose "Executing query on $uri, try $($maxRetries-$retries) / $maxRetries"
        $response = $request.GetResponse()
        $retries = 0
      }
      catch {
        $retries = $retries - 1

        if ($retries -le 0) {
          throw "Query failed: $($_.Exception)"
        }
        else{
          Write-Verbose ("Query failed: $($_.Exception). Trying again.")
        }
        Start-Sleep 5
      }

    } while ($retries -gt 0)

    $responseContentLength = $response.get_ContentLength()
    if ($responseContentLength -ge 1024) {
      $totalLength = [System.Math]::Floor($responseContentLength / 1024)
    }
    else {
      $totalLength = 1
    }

    # Someone else may be downloading this file at this time, so we'll wait until they release the
    # lock and then we check the size
    Write-Verbose ("Target file is $target")

    # get file information if it exists to see if it contains the contents we want
    # and if file does not exist, continue on with the download as usual 
    if(Test-Path -Path $target -PathType leaf){
      $r = GetHPSharedFileInformation -File $target -Mode "Read" -Wait -maxRetries $maxRetries -Progress:$progress -skipSignatureCheck:$skipSignatureCheck
      if ($noclobber -eq "skip") {
        if (($r[0] -eq $response.get_ContentLength()) -and ($r[2] -eq $true)) {
          Write-Verbose "File already exists or another process has finished downloading this file for us."
          return
        }
        else {
          # overwrite=skip means skip overwriting existing files without error so will not proceed with download 
          Write-Verbose ("Existing file $target doesn't seem correct (size=$($r[0]) vs expected $($response.get_ContentLength()), signature_check=$($r[2]). Skipping (will not overwrite). ")
          return 
        }
      }
    }

    $responseStream = $response.GetResponseStream()
    $targetStream = GetHPLockedStreamForWrite -maxRetries $maxRetries -Target $target
   
    $buffer = New-Object byte[] 10KB
    $count = $responseStream.Read($buffer,0,$buffer.Length)
    $downloadedBytes = $count

    #being too verbose with Write-Progress slows down the process
    $maxChunks = 20
    $chunkSize = $totalLength / $maxChunks
    while ($chunkSize -gt 1024) {
      $maxChunks = $maxChunks * 2
      $chunkSize = $totalLength / $maxChunks
    }

    if ($chunkSize -lt 16384) {
      $chunkSize = 16384
      $maxChunks = 1
    }

    $lastChunk = 0
    while ($count -gt 0) {
      $targetStream.Write($buffer,0,$count)
      $count = $responseStream.Read($buffer,0,$buffer.Length)
      $downloadedBytes = $downloadedBytes + $count
      $thisChunk = [System.Math]::Floor(($downloadedBytes / 100) / $totalLength)

      # warning: do not update progress every iteration because it slows down the download significantly
      # i.e. SoftPaq 144724 will take 14-17 mins instead of 30-40 seconds to download
      if (($progress -eq $true) -and ($thisChunk -gt $lastChunk)) {
        $lastChunk = $thisChunk
        Write-Progress -Activity "Downloading file '$($url.split('/') | Select -Last 1)'" -Status "Downloaded ($([System.Math]::Floor($downloadedBytes/1024))K of $($totalLength)K): " -PercentComplete ((([System.Math]::Floor($downloadedBytes / 1024)) / $totalLength) * 100)
      }
    }

    if ($progress -eq $true) {
      Write-Verbose ("Finished downloading '$($url.split('/') | Select-Object -Last 1)'")
      Write-Progress -Activity "Finished downloading file '$($url.split('/') | Select-Object -Last 1)'" -Completed
    }
  }
  catch{
    throw ("Failed to download due to $($_.Exception)")
  }
  finally {
    if ($targetStream) {
      $targetStream.Flush()
      $targetStream.Close()
      $targetStream.Dispose()
    }

    if ($responseStream) {
      $responseStream.Close()
      $responseStream.Dispose()
    }

    if ($response) {
      $response.Close()
    }
  }

}



<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateCurrentOs {
    switch ([string][System.Environment]::OSVersion.Version.Major + "." + [string][System.Environment]::OSVersion.Version.Minor) {
      "10.0" { $os = "win10" }
      "6.3" { $os = "win81" }
      "6.2" { $os = "win8" }
      "6.1" { $os = "win7" }
    }
    if ([string][System.Environment]::OSVersion.Version.Build -ge 22000) {
      $os = "win11"
    }
    return $os
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Send-HPPrivateKMSRequest
{
  [CmdletBinding()]
  param(
    [string]$KMSUri,
    [string]$JsonPayload,
    [string]$AccessToken,
    [string]$Method = "POST"
  )

  Write-Verbose "HTTPS Request $KMSUri : $Method => $jsonPayload"
  $userAgent = Get-HPPrivateUserAgent
  $request = [System.Net.HttpWebRequest]::Create($KMSUri)

  if ($request -is [System.Net.HttpWebRequest]){
    Write-Verbose "Setting user agent $userAgent in HttpWebRequest"
    $request.UserAgent = $userAgent
  }
  
  $request.Method = $Method
  $request.Timeout = -1
  $request.KeepAlive = $true
  $request.ReadWriteTimeout = -1
  $request.Headers.Add("Authorization","Bearer $AccessToken")
  if ($JsonPayload) {
    $content = [System.Text.Encoding]::UTF8.GetBytes($JsonPayload)
    $request.ContentType = "application/json"
    $request.ContentLength = $content.Length
    $stream = $request.GetRequestStream()
    $stream.Write($content,0,$content.Length)
    $stream.Flush()
    $stream.Close()
  }

  try {
    [System.Net.WebResponse]$response = $request.GetResponse()
  }
  catch [System.Net.WebException]{
    Write-Verbose $_.Exception.Message
    $response = $_.Exception.Response
  }

  if ($response.PSObject.Properties.Name -match 'StatusDescription') {
    $statusDescription = $response.StatusDescription
    $receiveStream = $response.GetResponseStream()
    $streamReader = New-Object System.IO.StreamReader $receiveStream
    $responseContent = $streamReader.ReadToEnd()
    $streamReader.Close()
    $streamReader.Dispose()
    Write-Verbose $responseContent
  }

  $response.Close()
  return $statusDescription,$responseContent
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Invoke-HPPrivateKMSErrorHandle {
  [CmdletBinding()]
  param(
    [string]$ApiResponseContent,
    [string]$Status
  )

  if ($Status -eq 'Not Found') {
    throw "URL not found"
  }

  try {
    $response = $ApiResponseContent | ConvertFrom-Json
  }
  catch {
    Write-Verbose $ApiResponseContent
    throw 'Error code malformed'
  }

  if ($response -and $response.PSObject.Properties.Name -contains 'errorCode') {
    switch ($response.errorCode) {
      # Internal errors codes are suppressed
      401 { throw "Error code ($_): Unauthorized" }
      402 { throw "Error code ($_): Key does not exist" }
      403 { throw "Error code ($_): Key does not exist" }
      404 { throw "Error code ($_): Error while adding key to vault" }
      405 { throw "Error code ($_): Unauthorized" }
      406 { throw "Error code ($_): Invalid Azure tenant" }
      407 { throw "Error code ($_): User does not belong to any group" }
      408 { throw "Error code ($_): User does not belong to any group the key is assigned to" }
      409 { throw "Error code ($_): Invalid access token" }
      410 { throw "Error code ($_): Invalid access token" }
      411 { throw "Error code ($_): Invalid access token" }
      412 { throw "Error code ($_): Invalid access token" }
      413 { throw "Error code ($_): Invalid key id" }
      414 { throw "Error code ($_): Unauthorized" }
      415 { throw "Error code ($_): Failed to recover secret" }
      416 { throw "Error code ($_): Invalid request" }
      417 { throw "Error code ($_): Unauthorized" }
      418 { throw "Error code ($_): Invalid request" }
      419 { throw "Error code ($_): Invalid request" }
      420 { throw "Error code ($_): Key not concurrent" }
      440 { throw "Error code ($_): Permission table functionality not supported" }
      430 { throw "Error code ($_): Unauthorized" }
      431 { throw "Error code ($_): Key mapping already exists" }
      432 { throw "Error code ($_): Unauthorized" }
      433 { throw "Error code ($_): Invalid key mapping" }
      434 { throw "Error code ($_): Unauthorized" }
      435 { throw "Error code ($_): Invalid key mapping" }
      436 { throw "Error code ($_): Unauthorized" }
      437 { throw "Error code ($_): Invalid key mapping" }
      438 { throw "Error code ($_): Incorrect content-type" }
      439 { throw "Error code ($_): Multiple changes for the same device id is not supported" }
      501 { throw "Error code ($_): Key already exists" }
      502 { throw "Error code ($_): Invalid key id" }
      503 { throw "Error code ($_): Invalid key id" }
      504 { throw "Error code ($_): Invalid key id" }
      601 { throw "Error code ($_): Invalid request" }
      602 { throw "Error code ($_): Invalid key id" }
      603 { throw "Error code ($_): Unauthorized" }
      604 { throw "Error code ($_): Malformed key" }
      606 { throw "Error code ($_): Same EK and SK is not allowed" }
      default { throw "Error code ($_)" }
    }
  }

  Write-Verbose $ApiResponseContent
  throw "Wrong URL or error code malformed"
}

<#
.SYNOPSIS
  This is a private command for internal use only.
  Determine if running in WinPE.

.DESCRIPTION
  This is a private command for internal use only.
  Returns $true if running in Win PE, $false otherwise.

.EXAMPLE
  Test-HPWinPE
#>
function Test-HPWinPE
{
  [CmdletBinding()]
  [Alias('Test-WinPE')]
  param()

  $r = Test-Path -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlset\Control\MiniNT
  Write-Verbose ("Running in Windows PE: $r")
  $r
}

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateCurrentOsBitness {
  if ([environment]::Is64BitOperatingSystem -eq $true) {
    $output = systeminfo | findstr /C:"System Type"

    if($output -match "ARM64-based PC") { # ARM64-based PC means ARM64
      return "arm64"
    }
    else { # x64-based PC means x64
      return 64 
    }
  }
  else {
    return 32
  }
}

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateUnicodePath {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)]
    [string]$Path
  )

  return "\\?\$Path"
}

# perform an action after a SoftPaq download completed

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Invoke-HPPostDownloadSoftpaqAction
{
  [CmdletBinding()]
  [Alias('Invoke-PostDownloadSoftpaqAction')]
  param([string]$downloadedFile,[string]$action,[string]$number,$info,[string]$Destination, [SecureString]$password)

  Write-Verbose 'Processing post-download action'
  $PostDownloadCmd = $null

  switch ($action) {
    "extract" {
      if (!$Destination) {
        $Destination = (Get-Item $downloadedFile).DirectoryName
        $Destination = Join-Path -Path $Destination -ChildPath (Get-Item $downloadedFile).BaseName
      }

      Write-Verbose -Message "Extracting $downloadedFile to: $Destination"
      $output = Start-Process -Wait -PassThru "$downloadedFile" -ArgumentList "-e -f `"$Destination`"","-s"
      $result = $?
      Write-Verbose -Message "Extraction result: $result"
    }
    "install" {
      #$PostDownloadCmd = descendNodesAndGet  $info -field "install" 
      if($Destination){
        # the /f switch for SoftPaq executables = the runtime switch that 
        # overrides the default target path specified in build time 
        $output = Start-Process -Wait -PassThru "$downloadedFile" -ArgumentList "/f `"$Destination`""
      }
      else{
        # default destination folder is C:\SWSetup\SP<$number>
        $output = Start-Process -Wait -PassThru "$downloadedFile"
      }

      $result = $?
      Write-Verbose -Message "Installation result: $result"
    }
    "silentinstall" {
      # Get the silent install command from the metadata
      if (!$info) { $info = Get-HPSoftpaqMetadata $number }

      $PostDownloadCmd = $info | Out-HPSoftpaqField -Field "silentinstall"
      $passwordBinFile = $null
      Write-Verbose ("Checking if $PostDownloadCmd includes HpFirmwareUpdRec.exe")

      if($PostDownloadCmd.Contains("HpFirmwareUpdRec.exe")){
        Write-Verbose ("BIOS FUR SoftPaq detected.")
        # if password is provided, create password file 
        # Write-HPFirmwarePasswordFile will throw an exception if there was an issue creating the password file
        if($password){
          Write-Verbose ("Password provided. Creating password file.")
          try{
            # convert secure string to plain text password
            $passwordPlainText = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
            Write-HPFirmwarePasswordFile -Password $passwordPlainText 
          }
          catch{
            # No need to check BIOS Update Credential Policy first because if Password is provided, CMSL should create a password file
            throw "CMSL failed to create a password file. Will not continue: $_"
          }

          $passwordBinFile = Get-ChildItem -Path (Get-Location) -Filter "password.bin" -File 

          # Check to ensure password.bin file exists
          if($passwordBinFile){
            Write-Verbose ("Adding password to argument list: `"$($passwordBinFile.FullName)`"")
            $PostDownloadCmd += " -p '$($passwordBinFile.FullName)'"
            Write-Verbose ("PostDownloadCmd after adding password: $PostDownloadCmd")
          }
          else{
            # if password.bin file does not exist, we cannot continue with the silent install
            throw "CMSL failed to create a password file. Will not continue."
          }
        }
        else {
          Write-Verbose "No password provided."
        }
      }

      if($Destination){
        # the /f switch for SoftPaq executables = the runtime switch that 
        # overrides the default target path specified in build time 
        $output = Start-Process -Wait -PassThru "$downloadedFile" -ArgumentList "-s","-e cmd.exe","/f `"$Destination`"","-a","/c $PostDownloadCmd"
      }
      else{
        # default destination folder is C:\SWSetup\SP<$number>
        $output = Start-Process -Wait -PassThru "$downloadedFile" -ArgumentList "-s","-e cmd.exe","-a","/c $PostDownloadCmd"
      }
      $result = $?
      Write-Verbose -Message "Silent installation result: $result"

      # get corresponding return code description from the metadata
      $returnCodes = $info.ReturnCode 
      if ($returnCodes) {
        foreach ($code in $returnCodes.Keys) {
          if ($code.StartsWith($output.ExitCode.ToString())) {
            Write-Verbose -Message "Return code $($code) matches SoftPaq exit code $($output.ExitCode)"
            Write-Verbose -Message "Return code description: $($returnCodes[$code])"
          }
        }
      }
      
      # delete password file immediately after FUR SoftPaq is executed because FUR will handle password usage for firmware updates 
      if($passwordBinFile){
        Write-Verbose ("Deleting password file: $($passwordBinFile.FullName)")
        Remove-Item -Path $passwordBinFile.FullName -Force -ErrorAction Ignore
      }
    }
  }

  # -PassThru switch for Start-Process allows us to get the process object output. Then, we can check the exit code of the 
  # SoftPaq executable to get the specific error code. This is more useful for debugging than just getting a boolean result.
  Write-Verbose -Message "The $action process exited with return code: $($output.ExitCode)"
  
  Write-Verbose 'Post-download action processing complete'
}

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateAllowedHttpsProtocols {
  [CmdletBinding()]
  param()

  $c = [System.Net.SecurityProtocolType]([System.Net.SecurityProtocolType].GetEnumNames() | Where-Object { $_ -ne "Ssl3" -and $_ -ne "Tls" -and $_ -ne "Tls11" })
  Write-Verbose "Removing obsolete protocols SSL 3.0, TLS 1.0, and TLS 1.1; now supporting: $c"
  $c
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateCacheDirPath {

  [CmdletBinding()]
  param([System.IO.DirectoryInfo]$seed)

  if (-not $seed) {
    $seed = [System.IO.Path]::GetTempPath() + "hp"
  }
  Join-Path -Path $seed -ChildPath "cache"
  Write-Verbose "Local caching path is: $seed"
}

# check authenticode signature
# check CVA and SoftPaq hash to determine download of the SoftPaq
#
# tests (remove these comments once we are happy with the function)
#
#  PASS: Get-HPPrivateCheckSignature -file C:\windows\System32\notepad.exe -signedBy "Microsoft Windows" -Verbose
#  PASS: Get-HPPrivateCheckSignature -file C:\windows\System32\notepad.exe -Verbose
#  PASS: Get-HPPrivateCheckSignature -file .\sp99062.exe -CVAfile .\sp99062.cva -Verbose
#  PASS: Get-HPPrivateCheckSignature -file .\sp99062.exe -CVAfile .\sp99062.cva -Verbose -signedBy "HP Inc."

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateCheckSignature {
  [CmdletBinding()]
  param(
    [Parameter(Position = 0,Mandatory = $true)]
    [string]$file,

    [Parameter(Mandatory = $false,Position = 1)]
    [string]$CVAfile = $null,

    [Parameter(Mandatory = $false,Position = 2)]
    [string]$signedBy = $null,

    [Parameter(Mandatory = $false,Position = 3)]
    [switch]$Progress

  )

  if ($Progress.IsPresent) {
    Write-Progress -Activity "Checking integrity of $file"
  }

  try {

    if ($file.StartsWith('\\?\')) {
      $c = Get-AuthenticodeSignature -LiteralPath $file
    }
    else {
      $c = Get-AuthenticodeSignature -FilePath $file
    }

    if ($c.Status -ne "Valid") {
      Write-Verbose ("$file is not signed or certificate is invalid.")
      return $false
    }
    if ($signedBy) {
      $signer = $c.SignerCertificate.Subject.Split(",")[0].trim().Split("=")[1]

      if ($signer -ne $signedBy) {
        Write-Verbose ("$file is not signed by $signedBy; it is signed by $signer, failing.")
        return $false
      }
      else {
        Write-Verbose ("$file is signed by $signedBy.")
        # return $true
      }
    }

    if ($CVAfile) {
      Write-Verbose "Verifying '$file' using '$CVAFile'"

      $targetFile = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($file)
      $targetCVA = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($CVAFile)

      # Getting hash value of CVA
      $read_file = Get-HPPrivateReadINI -File $targetCVA
      $CVA_SHA256 = $read_file | Out-HPSoftpaqField -Field SoftPaqSHA256

      Write-Verbose "CVA has SHA-256 hash '$CVA_SHA256'"
      if ($CVA_SHA256 -and $CVA_SHA256.Length -eq 64) {
        Write-Verbose 'Checking EXE SHA-256 hash'
        $EXE_SHA256 = (Get-FileHash -Path $targetFile -Algorithm SHA256).Hash
        Write-Verbose "EXE has SHA256 hash: $EXE_SHA256"

        $sha256match = $CVA_SHA256 -eq $EXE_SHA256
        Write-Verbose "SHA-256 matched: $sha256match"
        return $sha256match
      }
      else {
        Write-Verbose 'This CVA file has no checksum value'
        return $false
      }
    }

    # When only file is passed and it has valid signature
    return $true
  }
  catch {
    Write-Verbose "Had exception $($_.Exception.Message) during signature check"
    return $false
  }
  finally {
    if ($Progress.IsPresent) {
      Write-Progress -Activity "Finished checking integrity of $file" -Completed
    }
  }
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Invoke-HPPrivateDeleteCachedItem {
  [CmdletBinding()]
  param([Parameter(Mandatory = $true)] $cab)

  Invoke-HPPrivateSafeRemove -Path $cab
  Invoke-HPPrivateSafeRemove -Path "$cab.dir" -Recurse
}



<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Invoke-HPPrivateSafeRemove {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true,ValueFromPipelineByPropertyName = $true)] [string[]]$path,
    [Parameter(Mandatory = $false)] [switch]$recurse
  )
  foreach ($p in $path) {
    if (Test-Path $p) {
      Write-Verbose "Removing $p"
      Remove-Item $p -Recurse:$recurse
    }
  }
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Invoke-HPPrivateExpandCAB {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)] $cab,
    [Parameter(Mandatory = $false)] $expectedFile # check for file inside expanded CAB 
  )
  Write-Verbose "Expanding CAB $cab to $cab.dir"

  $target = "$cab.dir"
  Invoke-HPPrivateSafeRemove -Path $target -Recurse -Verbose:$VerbosePreference
  Write-Verbose "Expanding $cab to $target"
  $result = New-Item -Force $target -ItemType Directory
  Write-Verbose "Created folder $result"

  $shell = New-Object -ComObject "Shell.Application"
  $exception = $null
  try {
    if (!$?) { $(throw "unable to create $comObject object") }
    $sourceCab = $shell.Namespace($cab).items()
    $DestinationFolder = $shell.Namespace($target)
    $DestinationFolder.CopyHere($sourceCab)
  }
  catch {
    $exception = $_.Exception
  }
  finally {
    [System.Runtime.InteropServices.Marshal]::ReleaseComObject([System.__ComObject]$shell) | Out-Null
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()
  }

  if ($exception) {
    throw "Failed to decompress $cab. $($exception.Message)."
  }

  if ($expectedFile){
    
    $downloadedOk = Test-Path $expectedFile
    if ($downloadedOk -eq $false) {
      throw "Invalid cab file, did not find $expectedFile in contents"
    }

    return $expectedFile
  }

}


# check if a download is needed, based on file existence and the remote last-modified time

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Test-HPPrivateIsDownloadNeeded {
  [CmdletBinding()]
  param([Parameter(Mandatory = $true)] $url,[Parameter(Mandatory = $true)] $file)

  Write-Verbose "Checking if we need a new copy of $file from $url"

  # $c = [System.Net.ServicePointManager]::SecurityProtocol
  # Write-Verbose ("Allowed HTTPS protocols: $c")
  [System.Net.ServicePointManager]::SecurityProtocol = Get-HPPrivateAllowedHttpsProtocols
  $userAgent = Get-HPPrivateUserAgent

  # need to validate if $header can be generated, in other words if $url is legitimate
  try {
    $headers = (Invoke-WebRequest -Uri $url -UserAgent $userAgent -Method HEAD -UseBasicParsing).Headers
    [datetime]$offered = [string]$headers["Last-Modified"]
    Write-Verbose "File on server has timestamp $offered"
  }
  catch {
    Write-Verbose "HTTPS request to $url failed: $($_.Exception.Message)"
    throw
  }

  $exists = Test-Path -Path $file -PathType leaf
  if ($exists -eq $false) {
    Write-Verbose "Cached file $file does not exist. Need to download new file."
    $offered
    $true
  }
  else {
    [datetime]$have = (Get-Item $file).CreationTime
    $r = ($have -lt $offered)
    Write-Verbose "Cached file exists and has timestamp $have. Need to download: $r"

    $offered
    $r
  }
}

# check if script is running on ISE

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Test-HPPrivateIsRunningOnISE {
  [CmdletBinding()]
  param()

  return $null -ne $(Get-Variable -Name psISE -ErrorAction Ignore)
}

# check if long-path registry key is set

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Test-HPPrivateIsLongPathSupported {
  [CmdletBinding()]
  param()

  try {
    return $(Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem\' -Name LongPathsEnabled).LongPathsEnabled -eq 1
  }
  catch {
    Write-Verbose "Error accessing registry entry LongPathsEnabled: $($_.Exception.Message)"
    return $false
  }
}

# check if the downloaded xml file is corrupted.

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Test-HPPrivateIsValidXmlFile {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)] $file
  )

  if (-not (Test-Path -Path $file)) {
    Write-Verbose "File $file does not exist."
    return $false
  }

  # Check for Load or Parse errors when loading the XML file.
  $xml = New-Object System.Xml.XmlDocument
  try {
    $xml.Load($file)
    return $true
  }
  catch [System.Xml.XmlException]{
    Write-Verbose "Invalid XML file $file"
    return $false
  }
}

# get temporary file name

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateTempFileName {
  [CmdletBinding()]
  param()

  $tempFileName = [System.IO.Path]::GetTempFileName()
  $tempFileName = $tempFileName.TrimEnd('.tmp')
  $tempFileName = $($tempFileName -Split '\\')[-1]
  return $tempFileName
}

# get hp temporary file path

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateTempPath {
  [CmdletBinding()]
  param()

  $tempPath = [System.IO.Path]::GetTempPath()
  $tempPath = Join-Path -Path $tempPath -ChildPath 'hp'
  return [System.IO.DirectoryInfo]$tempPath
}

# get temporary file path

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateTempFilePath {
  [CmdletBinding()]
  param()

  [System.IO.DirectoryInfo]$tempPath = Join-Path -Path $([System.IO.Path]::GetTempPath()) -ChildPath 'hp'
  $tempFileName = Get-HPPrivateTempFileName
  return Join-Path -Path $tempPath.FullName -ChildPath $tempFileName
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateUserAgent () {
  "CMSL $($MyInvocation.MyCommand.Module.Version)"
}

# calculates CurrentOSVer

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function GetHPCurrentOSVer {
  [CmdletBinding()]
  [Alias('GetCurrentOSVer')]
  param()

  try {
    $result = [string](Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name DisplayVersion | Select-Object DisplayVersion).DisplayVersion

    if ($result -match '[0-9]{2}[hH][0-9]') {
      $bits = $result.substring(0,2)
      if ($bits -ge 21) {
        # for DisplayVersion >= 21XX, use the DisplayVersion as OSVer
        # convert OSVer to lower since the reference files have "21h1" in file name
        return $result.ToLower()
      }
    }
  }
  catch {
    Write-Verbose "Display Version not found. Fallback to ReleaseId."
  }

  # If DisplayVersion isn't found or DisplayVersion < 21XX, use ReleaseId instead
  $result = [string](Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name ReleaseID | Select-Object ReleaseID).ReleaseId
  return $result
}

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateCurrentDisplayOSVer {
  [CmdletBinding()]
  param()

  if ([string][System.Environment]::OSVersion.Version.Build -gt 19041) {
    $result = [string](Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name DisplayVersion | Select-Object DisplayVersion).DisplayVersion
  }
  else {
    $result = [string](Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name ReleaseID | Select-Object ReleaseID).ReleaseId
  }

  return $result
}

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function validateHPWmiResult {
  [CmdletBinding()]
  [Alias('validateWmiResult')]
  param([int]$code,[int]$category = 0xff)

  Write-Verbose "Validating error code $code for facility $category"
  switch ($code) {
    0 {}
    0xea {}
    6 { throw [NotSupportedException]"Operation could not be completed. Please ensure this is a supported HP system." }
    5 { throw [ArgumentException]"Method called with invalid parameters." }
    4 { throw [UnauthorizedAccessException]"The caller does not have permissions to perform this operation." }
    0x1000 { throw [SystemException]"HP Secure Platform Management is not provisioned." }
    0x1c { throw [SystemException]"The request was not accepted by the BIOS." }
    default { validateHPWmiResultInCategory -Category $category -code $code }
  }
}

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function validateHPWmiResultInCategory {
  [CmdletBinding()]
  [Alias('validateWmiResultInCategory')]
  param([int]$category,[int]$code)

  switch ($category) {
    1 {
      switch ($code) {
        0x40 { throw [NotSupportedException]"This system does not support firmware logs." }
        0x41 { throw [System.TimeoutException]"Call has timed out." }
        default { throw [SystemException]"An unknown error $code has occured." }
      }
    }
    2 {
      switch ($code) {
        0x0b { throw [UnauthorizedAccessException]"The caller does not have permissions to perform this operation." }
        0x0e { throw [UnauthorizedAccessException]"The operation could not be completed, possibly due to a bios password mismatch?" }
        0x0010 { throw [SystemException]"Invalid flash offset." }
        0x0011 { throw [SystemException]"Invalid flash interface version" }
        0x0012 { throw [SystemException]"Invalid flash checksum" }
        0x0013 { throw [InvalidOperationException]"Flash-in-progress error" }
        0x0014 { throw [InvalidOperationException]"Flash-in-progress not set" }
        0x0015 { throw [InvalidOperationException]"Flash not allowed" }
        default { throw [SystemException]"An unknown error $code has occured." }
      }
    }
    3 {
      switch ($code) {
        # this facility doesn't define specific codes
        default { throw [SystemException]"An unknown error $code has occured." }
      }
    }
    4 {
      switch ($code) {
        0x0b { throw [UnauthorizedAccessException]"The caller does not have permissions to perform this operation." }
        0x03 { throw [NotSupportedException]"This system does not support HP Secure Platform Management or a hardware option is missing." }
        0x1001 { throw [SystemException]"HP Secure Platform Management is already provisioned." }
        0x1002 { throw [SystemException]"HP Secure Platform Management is in use. Deprovision all features that use the HP Secure Platform Management first." }
        default { throw [SystemException]"An unknown error $code has occured." }
      }
    }
    5 {
      switch ($code) {
        0x03 { throw [NotSupportedException]"This system does not support HP Sure Recover or there is a configuration issue." }
        default { throw [SystemException]"An unknown error $code has occured." }
      }
    }
    default {
      throw [SystemException]"An unknown error $code has occured."
    }
  }
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Test-HPPrivateCustomResult {
  [CmdletBinding()]
  param([int]$result,[int64]$mi_result,[int]$category)
  Write-Verbose ("Checking result={0:x8}, mi_result={1:x8}, category={2:x4}" -f $result,$mi_result,$category)
  switch ($result) {
    0 { Write-Verbose ("Operation succeeded.") }
    0x80000711 { validateHPWmiResult -code $mi_result -Category $category } # E_DFM_FAILED_WITH_EXTENDED_ERROR
    0x80000710 { throw [NotSupportedException]"Current platform does not support this operation." } # E_DFM_FEATURE_NOT_SUPPORTED
    0x8000070b { throw [System.IO.IOException]"Firmware file could not be read." } # E_DFM_FILE_ACCESS_FAILURE
    0x8000070e { throw [InvalidOperationException]"Firmware file is too long for expected flash type." } # E_DFM_FLASH_BUR_INPUT_DATA_TOO_LARGE
    0x80000712 { throw [InvalidOperationException]"The firmware does not mach the target platform." } # E_DFM_WRONG_FLASH_FILE
    0x80000714 { throw [OutOfMemoryException]"A memory allocation failed. The system may be out of memory." } # E_DFM_ALLOC_FAILED
    0x80000715 { throw [InvalidOperationException]"Password length is not valid." } # E_DFM_PASSWORD_SIZE_INVALID
    0x8000071a { throw [System.ArgumentException]"Invalid parameter for HP Sure View API" }
    1392 { throw [System.IO.IOException]"Could not copy the file to the system partition." } # ERROR_FILE_CORRUPT
    234 { Write-Verbose ("Operation succeeded.") } # MORE_DATA
    default { throw [ComponentModel.Win32Exception]$result }
  }

}



<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Convert-HPPrivateObjectToBytes {
  [CmdletBinding()]
  param($obj)

  $mem = $null
  $length = 0
  $bytes = $()


  Write-Verbose "Converting object of type $($obj.Gettype()) to byte array"
  try {
    $length = [System.Runtime.InteropServices.Marshal]::SizeOf($obj)
    $bytes = New-Object byte[] $length
    Write-Verbose "Converting object of type $($obj.Gettype()) is $length bytes"
    $mem = [System.Runtime.InteropServices.Marshal]::AllocHGlobal($length)

    [System.Runtime.InteropServices.Marshal]::StructureToPtr($obj,$mem,$true)
    [System.Runtime.InteropServices.Marshal]::Copy($mem,$bytes,0,$length)
    ($bytes,$length)
  }
  finally {
    # Free the memory we allocated for the struct value
    if ($mem) {
      Write-Verbose "Freeing allocated memory"
      [System.Runtime.InteropServices.Marshal]::FreeHGlobal($mem)
    }
  }
  Write-Verbose "Conversion complete."

}


#region Cryptography


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivatePublicKeyCoalesce {
  [CmdletBinding()]
  param(
    [System.IO.FileInfo]$file,
    [psobject]$key
  )

  if ($file) {
    $efile = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($file)
    Write-Verbose "Coalescing to FILE PEM $efile"
    $modulus = New-Object arr4k_t
    $modulus_size = 4096
    $exponent = 0
    $mi_result = 0

    if((Test-HPOSBitness) -eq 32){
      $result = [X509Utilities]::get_public_key_from_pem32($efile,[ref]$modulus, [ref]$modulus_size, [ref]$exponent)
    }
    else {
      $result = [X509Utilities]::get_public_key_from_pem64($efile,[ref]$modulus, [ref]$modulus_size, [ref]$exponent)
    }

    Test-HPPrivateCustomResult -result $result -mi_result $mi_result -Category 0x04
    New-Object -TypeName PSObject -Property @{
      Modulus = $modulus.raw[0..($modulus_size - 1)]
      Exponent = $exponent
    }

  }
  else {
    Write-Verbose "Coalescing to binary PEM"
    $key
  }

}



<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateX509CertCoalesce {
  [CmdletBinding()]
  param(
    [System.IO.FileInfo]$file,
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$cert,
    [string]$password
  )
  $param = @{}
  if ($password) {
    $param.Add("Password",(ConvertTo-SecureString -AsPlainText -Force $password))
  }

  if ($file) {
    $efile = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($file)

    Write-Verbose "Coalescing to FILE certificate $efile"
    $param.Add("FileName",$efile)
    Get-HPPrivatePublicKeyCertificateFromPFX @param -Verbose:$VerbosePreference
  }
  else {
    Write-Verbose "Coalescing to binary certificate"
    $key = $cert.PublicKey.key
    $parameters = $key.ExportParameters($false);
    $mod_reversed = $parameters.Modulus
    [array]::Reverse($mod_reversed)
    New-Object -TypeName PSObject -Property @{
      Full = $Cert
      Certificate = $cert.Export('Cert')
      Modulus = $mod_reversed
      Exponent = $parameters.Exponent
    }
  }
}


# get the PK from a PFX file

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivatePublicKeyCertificateFromPFX {
  [CmdletBinding(DefaultParameterSetName = "FF")]
  param(
    [Parameter(Mandatory = $true,Position = 0)]
    [string]$FileName,

    [Parameter(Mandatory = $false,Position = 1)]
    [securestring]$Password
  )

  $certfile = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($FileName)
  if (-not (Test-Path -PathType leaf -Path $certfile)) {
    throw [System.IO.FileNotFoundException]"Certificate file '$certfile' could not be found"
  }
  Write-Verbose "Extracting public key from '$certfile'."

  try {
    $cert = New-Object -TypeName System.Security.Cryptography.X509Certificates.X509Certificate2 -ArgumentList ($certfile,$Password,'Exportable')
    $key = $cert.PublicKey.Key
    $parameters = $key.ExportParameters($false);

    $mod_reversed = $parameters.Modulus
    [array]::Reverse($mod_reversed)
    New-Object -TypeName PSObject -Property @{
      Full = $cert
      Certificate = $cert.Export('Cert')
      Modulus = $mod_reversed
      Exponent = $parameters.Exponent
    }
  }
  finally {
    #$cert.Dispose();
    #$cert = $null
  }

}

# sign a byte array with a certificate provided in $Filename

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Invoke-HPPrivateSignData {
  [CmdletBinding()]
  param(
    [System.Security.Cryptography.X509Certificates.X509Certificate2]$Certificate,
    [byte[]]$Data
  )
  $privKey = $Certificate.PrivateKey
  if ($null -eq $privKey) {
    Write-Error "Please provide an exportable key in the PFX file"
  }
  $params = $privKey.ExportParameters($true)
  $cspParams = New-Object System.Security.Cryptography.CspParameters (24,"Microsoft Enhanced RSA and AES Cryptographic Provider")
  $enhancedSignCsp = New-Object System.Security.Cryptography.RSACryptoServiceProvider ($cspParams)
  $enhancedSignCsp.ImportParameters($params)

  $result = $enhancedSignCsp.SignData($Data,[System.Security.Cryptography.HashAlgorithmName]::SHA256,[System.Security.Cryptography.RSASignaturePadding]::Pkcs1)
  [array]::Reverse($result)
  return $result
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateHash {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true,Position = 0)] [byte[]]$data,
    [Parameter(Mandatory = $false,Position = 1)] [string]$algo = "SHA256"
  )
  $cp = [System.Security.Cryptography.HashAlgorithm]::Create($algo)
  try {
    $result = $cp.ComputeHash($data)
  }
  finally {
    $cp.Dispose()
  }
  $result

}
#endregion

# Downloads files for when OfflineCacheMode is Enable
# If -platform is present : Downloads Advisory Data Files (XXXX_cds.cab) where XXXX is platform ID.
# also downloads the platform List

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateOfflineCacheFiles {
  [CmdletBinding()]
  param(
    [string]$url,
    [string]$filename,
    [System.IO.DirectoryInfo]$cacheDirOffline = [System.IO.Path]::GetTempPath() + "hp",
    [switch]$expand
  )

  $file = Get-HPPrivateTemporaryFileName -FileName $filename -cacheDir $cacheDirOffline
  $filename = $filename.Replace("cab","xml")
  $downloadedFile = "$file.dir\$filename"

  Write-Verbose "Checking if $url is available locally."
  try {
    $result = Test-HPPrivateIsDownloadNeeded -url $url -File $file -Verbose:$VerbosePreference
  }
  catch {
    throw [System.Net.WebException]"Could not find data file $url"
  }

  if ($result[1] -eq $true) {
    Write-Verbose "$url is not local or is out of date, will download."
    Write-Verbose "Cleaning cached data and downloading the data file."
    Invoke-HPPrivateDeleteCachedItem -cab $file
    Invoke-HPPrivateDownloadFile -url $url -Target $file -Verbose:$VerbosePreference
    (Get-Item $file).CreationTime = ($result[0])
    (Get-Item $file).LastWriteTime = ($result[0])
  }

  if ($expand.IsPresent) {
    # Need to make sure that the expanded data file exists and is not corrupted.
    # Otherwise, expand the cab file.
    if (-not (Test-Path $downloadedFile) -or (-not (Test-HPPrivateIsValidXmlFile -File $downloadedFile))) {
      Write-Verbose "Extracting the data file and looking for $downloadedFile."
      $file = Invoke-HPPrivateExpandCAB -cab $file -expectedFile $downloadedFile
    }
  }
  return $downloadedFile
}

# build URL for a remote item

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateItemUrl (
  [CmdletBinding()]
  [int]$Number,
  [string]$Ext,
  [string]$Url) {
  if ($url) {
    return "$url/sp$number.$ext"
  }

  [string]$baseNumber = $number.ToString()
  [int]$last3Value = [int]($baseNumber.substring($baseNumber.Length - 3))
  [int]$blockStart = [int]($baseNumber.substring(0,$baseNumber.Length - 3))

  [string]$block = ""
  [int]$blockEnd = $blockStart

  if ($last3Value -gt 500) {
    $blockEnd += 1
    $block = "$($blockStart)501-$($blockEnd)000"
  }
  else {
    if ($last3Value -eq 0) {
      $blockStart -= 1
      $block = "$($blockStart)501-$($blockEnd)000"
    }
    else {
      $block = "$($blockStart)001-$($blockStart)500"
    }
  }

  return "https://ftp.hp.com/pub/softpaq/sp$block/sp$number.$ext"
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function biosHPErrorCodesToString  {
  [CmdletBinding()]
  [Alias('biosErrorCodesToString')]
  param (
    [Parameter(Mandatory = $true,Position = 0)]
    [int]$code
  )
  
  switch ($code) {
    0 { return "OK" }
    1 { return "Not Supported" }
    2 { return "Unspecified error" }
    3 { return "Operation timed out" }
    4 { return "Operation failed or setting name is invalid" }
    5 { return "Invalid parameter" }
    6 { return "Access denied or incorrect password" }
    7 { return "Bios user already exists" }
    8 { return "Bios user not present" }
    9 { return "Bios user name too long" }
    10 { return "Password policy not met" }
    11 { return "Invalid keyboard layout" }
    12 { return "Too many users" }
    32768 { return "Security or password policy not met" }
    default { return "Unknown error: $code" }
  }
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function getHPBiosSettingInterface {
  [CmdletBinding(DefaultParameterSetName = 'nNwSession')]
  [Alias('getBiosSettingInterface')]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $false)]
    [string]$Target = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $true)]
    [CimSession]$CimSession
  )
  $defaultAction = $ErrorActionPreference
  $ns = getHPNamespace
  $ErrorActionPreference = "Stop";

  try {
    Write-Verbose "Getting BIOS interface from '$target' for namespace '$ns'"
    $params = @{
      Namespace = $ns
      Class = "HPBIOS_BIOSSettingInterface"
    }

    if ($CimSession) {
      $params.Add("CimSession",$CimSession)
    }

    if ($Target -and ($target -ne ".") -and -not $CimSession) {
      $params.Add("ComputerName",$Target)
    }


    $result = Get-CimInstance @params -ErrorAction stop
    if (-not $result) { throw [System.EntryPointNotFoundException]"Setting interface not found" }
  }
  catch {
    Write-Error "Method failed: $($_.Exception.Message)" -ErrorAction stop
  }
  finally {
    $ErrorActionPreference = $defaultAction
  }
  $result
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function getHPNamespace {
  [CmdletBinding()]
  [Alias('getNamespace')]
  param()
  [string]$c = [environment]::GetEnvironmentVariable("HP_BIOS_NAMESPACE","User")
  if (-not $c) {
    return "root\HP\InstrumentedBIOS"
  }
  
  # validate that namespace starts with root\HP
  if (-not $c.StartsWith("root\HP")) {
    throw "Unexpected BIOS namespace found: $c"
  }

  Write-Verbose ("Default BIOS namespace is overwritten via HP_BIOS_NAMESPACE Variable, to $c. This should only happen during development.")
  return $c
}

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateSecurePlatformIsProvisioned
{
  [boolean]$status = $false

  try {
    $result = Get-HPSecurePlatformState

    if ($result.State -eq "Provisioned") {
      $status = $true
    }
  }
  catch {}

  return $status
}

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateFileContent {
  [CmdletBinding()]
  param([System.IO.FileInfo]$File)

  $f = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($File)

  # Default encoding for PS5.1 is Default meaning the encoding that correpsonds to the system's active code page
  # Default encoding for PS7.3 is utf8NoBOM 
  [string]$content = Get-Content -Encoding UTF8 -Raw -Path $f -ErrorAction Stop

  return $content
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateSettingsFromPayload {
  [CmdletBinding()]
  param([string]$Content)
  $payload = $Content | ConvertFrom-Json

  if ($payload.purpose -ne "hp:sureadmin:biossettingslist") {
    throw "The payload should be generated by New-HPSureAdminBIOSSettingValuePayload function"
  }

  $data = [System.Text.Encoding]::UTF8.GetString($payload.Data)
  $settingsList = (Get-HPPrivateSettingsFromJson $data)

  return $settingsList
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateSettingsFromPayloadFile {
  [CmdletBinding()]
  param([System.IO.FileInfo]$File)
  $content = Get-HPPrivateFileContent $File
  return Get-HPPrivateSettingsFromPayload $content
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateSettingsFromJsonFile {
  [CmdletBinding()]
  param([System.IO.FileInfo]$File)
  [string]$content = Get-HPPrivateFileContent $File
  return (Get-HPPrivateSettingsFromJson $content)
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateSettingsFromJson {
  [CmdletBinding()]
  param([string]$Content)
  $list = $Content | ConvertFrom-Json

  $settingsList = New-Object System.Collections.Generic.List[SureAdminSetting]
  foreach ($item in $list) {
    $setting = New-Object -TypeName SureAdminSetting
    $setting.Name = $item.Name
    $setting.Value = $item.Value
    if ("AuthString" -in $item.PSObject.Properties.Name) {
      $setting.AuthString = $item.AuthString
    }
    $settingsList.Add($setting)
  }

  return $settingsList
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateSettingsFromBcuFile {
  [CmdletBinding()]
  param([System.IO.FileInfo]$File)
  $list = [ordered]@{}
  $auth = @{}
  $currset = ""

  Write-Verbose "Reading from file: $File"
  switch -regex -File $File {

    '^;Signature=<BEAM/>.*' {
      # keeping compatibility with BCU tool
      $c = $matches[0].trim()
      $auth[$currset] = $c.substring(11)
    }

    '^;AuthString=<BEAM/>.*' {
      $c = $matches[0].trim()
      $auth[$currset] = $c.substring(12)
    }

    '^\S.*$' {
      $currset = $matches[0].trim()
      if ($currset -ne "BIOSConfig 1.0" -and -not $currset.StartsWith(";")) {
        $list[$currset] = New-Object System.Collections.Generic.List[System.String]
      }
    }

    '^\s.*$' {
      # value (indented)
      $c = $matches[0].trim()
      $list[$currset].Add($c)
    }
  }

  $settingsList = New-Object System.Collections.Generic.List[SureAdminSetting]
  foreach ($s in $list.keys) {
    $setting = New-Object -TypeName SureAdminSetting
    $setting.Name = $s
    $setting.Value = Get-HPPrivateDesiredValue -Value $list[$s]
    if ($auth.ContainsKey($s)) {
      $setting.AuthString = $auth[$s]
    }
    $settingsList.Add($setting)
  }

  return $settingsList
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateDesiredValue {
  [CmdletBinding()]
  param($Value)

  $desired = $null

  $list = $Value -split ','
  foreach ($v in $list) {

    if ($v.StartsWith("*")) {
      # enum
      $desired = $v.substring(1)
      break
    }
  }

  if (-not $desired) {
    # not an enum
    if ($list.Count -eq 1) {
      $desired = $list # a string or int
    }
    else {
      $desired = $list -join ',' # an ordered list
    }
  }

  return $desired
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateSettingsFromCsvFile {
  [CmdletBinding()]
  param([System.IO.FileInfo]$File)
  Write-Verbose "Reading CSV"
  $content = Get-HPPrivateFileContent $File
  $items = $content | ConvertFrom-Csv

  $settingsList = New-Object System.Collections.Generic.List[SureAdminSetting]

  foreach ($item in $items) {
    $setting = New-Object -TypeName SureAdminSetting
    $setting.Name = $item.Name
    $setting.Value = (Get-HPPrivateDesiredValue $item.CURRENT_VALUE)
    if ("AUTHSTRING" -in $item.PSObject.Properties.Name) {
      $setting.AuthString = $item.AuthString
    }
    $settingsList.Add($setting)
  }

  return $settingsList
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateSettingsFromXmlFile {
  [CmdletBinding()]
  param([System.IO.FileInfo]$File)
  Write-Verbose "Reading XML"
  $content = Get-HPPrivateFileContent $File

  try {
    $entries = ([xml]$content).ImagePal.BIOSSettings.BIOSSetting
    $settingsList = New-Object System.Collections.Generic.List[SureAdminSetting]

    foreach ($item in $entries) {
      $setting = New-Object -TypeName SureAdminSetting
      $setting.Name = $item.Name
      $setting.Value = $item.Value
      if ("AuthString" -in $item.PSObject.Properties.Name) {
        # The XML parser adds an unwanted space in the tag BEAM
        $setting.AuthString = $item.AuthString.InnerXml -replace "<BEAM />","<BEAM/>"
      }
      $settingsList.Add($setting)
    }
  }
  catch [System.Management.Automation.PropertyNotFoundException]{
    throw [System.FormatException]'Invalid XML file.'
  }

  return $settingsList
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateSettingsFromFile {
  [CmdletBinding()]
  param(
    [System.IO.FileInfo]$FileName,
    [string]$Format
  )
  [System.Collections.Generic.List[SureAdminSetting]]$settingsList = $null

  switch ($Format) {
    { $_ -eq 'CSV' } { $settingsList = Get-HPPrivateSettingsFromCsvFile $FileName }
    { $_ -eq 'XML' } { $settingsList = Get-HPPrivateSettingsFromXmlFile $FileName }
    { $_ -eq 'JSON' } { $settingsList = Get-HPPrivateSettingsFromJsonFile $FileName }
    { $_ -eq 'BCU' } { $settingsList = Get-HPPrivateSettingsFromBcuFile $FileName }
    { $_ -eq 'payload' } { $settingsList = Get-HPPrivateSettingsFromPayloadFile $FileName }
    default { throw [System.FormatException]"Format specifier not provided, and could not determine format from file extension" }
  }

  return $settingsList
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Invoke-HPPrivateSetSetting {
  [CmdletBinding(DefaultParameterSetName = 'NewSession')]
  param(
    [Parameter(ParameterSetName = 'NewSession',Position = 0,Mandatory = $true)]
    [Parameter(ParameterSetName = 'ReuseSession',Position = 0,Mandatory = $true)]
    [SureAdminSetting]$Setting,
    [Parameter(ParameterSetName = 'NewSession',Position = 1,Mandatory = $false)]
    [Parameter(ParameterSetName = 'ReuseSession',Position = 1,Mandatory = $false)]
    [string]$Password,
    [Parameter(ParameterSetName = 'NewSession',Position = 2,Mandatory = $false)]
    [Parameter(ParameterSetName = 'ReuseSession',Position = 2,Mandatory = $false)]
    $ErrorHandling = 0,
    [Parameter(ParameterSetName = 'NewSession',Position = 3,Mandatory = $false)]
    [Parameter(ParameterSetName = 'ReuseSession',Position = 3,Mandatory = $false)]
    [Alias('Target')]
    [string]$ComputerName = ".",
    [Parameter(ParameterSetName = 'ReuseSession',Position = 4,Mandatory = $true)]
    [CimSession]$CimSession,
    [Parameter(ParameterSetName = 'NewSession',Position = 5,Mandatory = $false)]
    [Parameter(ParameterSetName = 'ReuseSession',Position = 5,Mandatory = $false)]
    [ref]$SingleSettingFailCounter
  )
  $readOnly = 0
  $notFound = 0
  $alreadySet = 0
  $localCounter = 0

  $s = $null
  if (-not $CimSession) { $CimSession = newHPCimSession -Target $ComputerName }

  try {
    $s = Get-HPBIOSSetting -Name $Setting.Name -CimSession $CimSession -ErrorAction stop
  }
  catch {
    $notFound = 1
    $SingleSettingFailCounter.Value = 0 #matching BCU, even if setting not found exit with 0
    $err = $PSItem.ToString()

    Write-Verbose "'$Setting.Name': $err"
    switch ($ErrorHandling) {
      0 { throw $err }
      1 { Write-Warning -Message "$err" }
      2 { Write-Verbose "Setting '$Setting.Name' could not be set, but ErrorHandling was set to 2 so error is quietly ignored" }
    }
    return $readOnly,$notFound,$alreadySet,$SingleSettingFailCounter.Value
  }

  if ($s) {
    switch ($s.CimClass.CimClassName) {
      "HPBIOS_BIOSEnumeration" {
        if ($s.CurrentValue -eq $Setting.Value) {
          $alreadySet = 1
          Write-Host "Setting $($Setting.Name) is already set to $($Setting.Value)"
        }
      }
      default {
        if ($s.Value -eq $Setting.Value) {
          $alreadySet = 1
          Write-Host "Setting $($Setting.Name) is already set to $($Setting.Value)"
        }
      }
    }

    if ($alreadySet -eq $false) {
      if ($s.IsReadOnly -eq 1) { $readOnly = 1 }
      else {
        if ($ErrorHandling -ne 1) {
          Set-HPPrivateBIOSSetting -Setting $setting -password $Password -CimSession $CimSession -SkipPrecheck $true -ErrorHandling $ErrorHandling -actualSetFailCounter ([ref]$localCounter) -Verbose:$VerbosePreference
          $SingleSettingFailCounter.Value = $localCounter
        }
        else {
          try {
            Set-HPPrivateBIOSSetting -Setting $setting -password $Password -CimSession $CimSession -SkipPrecheck $true -ErrorHandling $ErrorHandling -actualSetFailCounter ([ref]$localCounter) -Verbose:$VerbosePreference
          }
          catch {
            $SingleSettingFailCounter.Value = $localCounter
            $err = $PSItem.ToString()
          }
        }
      }
    }
  }

  return $readOnly,$notFound,$alreadySet,$SingleSettingFailCounter.Value
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateUseAuthString {
  [CmdletBinding()]
  param(
    [string]$SettingName
  )

  if ((Get-HPPrivateIsSureAdminEnabled) -eq $true -or $SettingName -eq "Enhanced BIOS Authentication Mode") {
    return $true
  }

  return $false
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Set-HPPrivateBIOSSetting {
  [CmdletBinding()]
  param(
    $Setting,
    [string]$ComputerName = ".",
    [CimSession]$CimSession,
    [switch]$SkipPrecheck,
    [AllowEmptyString()]
    [string]$Password,
    $ErrorHandling,
    [Parameter(Mandatory = $false)]
    [ref]$actualSetFailCounter
  )

  $localCounterForSet = 0

  if ($CimSession -eq $null) {
    $CimSession = newHPCimSession -Target $ComputerName
  }

  $Name = $Setting.Name
  $Value = $Setting.Value
  if ($Setting.AuthString -and (Get-HPPrivateUseAuthString -SettingName $Name) -eq $true) {
    $authorization = $Setting.AuthString
    Write-Verbose "Using authorization string"
  }
  else {
    $authorization = "<utf-16/>" + $Password
    Write-Verbose "Using BIOS Setup password"
  }

  if ($SkipPrecheck.IsPresent) {
    Write-Verbose "Skipping pre-check"

    if ($Name -eq "Setup Password" -or $Name -eq "Power-On Password") {
      $type = 'HPBIOS_BIOSPassword'
    }
    else {
      $type = 'HPBIOS_Setting'
    }
  }
  else {
    $obj = Get-HPBIOSSetting -Name $name -CimSession $CimSession -ErrorAction stop
    $type = $obj.CimClass.CimClassName
  }

  $c = getHPBiosSettingInterface -CimSession $CimSession
  switch ($type) {
    { $_ -eq 'HPBIOS_BIOSPassword' } {
      Write-Verbose "Setting Password setting '$Name' on '$ComputerName'"
      $Arguments = @{
        Name = $Name
        Value = "<utf-16/>" + [string]$Value
        Password = $authorization
      }
      $r = Invoke-CimMethod -InputObject $c -MethodName SetBiosSetting -Arguments $Arguments
    }

    default {
      Write-Verbose "Setting HP BIOS Setting '$Name' to value '$Value' on '$ComputerName'"
      $Arguments = @{
        Name = $Name
        Value = [string]$Value
        Password = $authorization;
      }
      $r = Invoke-CimMethod -InputObject $c -MethodName SetBiosSetting -Arguments $Arguments
    }
  }

  if ($r.Return -eq 0) {
    $message = "HP BIOS Setting $Name successfully set"
    if ($Name -ne "Setup Password" -and $Name -ne "Power-On Password") {
      $message += " to $Value"
    }
    Write-Host -ForegroundColor Green $message
  }
  else {

    $localCounterForSet++

    if ($r.Return -eq 5) { # Invalid parameter
      Write-Host -ForegroundColor Magenta "Operation failed. Please make sure that you are passing a valid value."
      Write-Host -ForegroundColor Magenta "Some variable names or values may be case sensitive."
    }

    $Err = "$(biosHPErrorCodesToString($r.Return))"
    if ($ErrorHandling -eq 1) {
      Write-Host -ForegroundColor Red "Failed to set $($setting.Name) to $($setting.Value): $Err"
      $actualSetFailCounter.Value = $localCounterForSet
    }

    throw "Failed to set $($setting.Name) to $($setting.Value). $Err."
  }
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateIsSureAdminEnabled {
  [CmdletBinding()]
  param()

  [boolean]$status = $false

  if ((Get-HPPrivateIsSureAdminSupported) -eq $true) {
    try {
      $mode = (Get-HPBIOSSettingValue -Name "Enhanced BIOS Authentication Mode")
      if ($mode -eq "Enable") {
        $status = $true
      }
    }
    catch {}
  }

  return $status
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Get-HPPrivateIsSureAdminSupported {
  [CmdletBinding()]
  param()

  [boolean]$status = $false
  try {
    $mode = (Get-HPBIOSSettingValue -Name "Enhanced BIOS Authentication Mode")
    $status = $true
  }
  catch {}

  return $status
}

<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function newHPCimSession () {
  [CmdletBinding()]
  [Alias('newCimSession')]
  param
  (
    [Parameter(Position = 0)] $SkipTestConnection = $true,
    [Parameter(Position = 1)] $Protocol = 'DCOM',
    [Parameter(Position = 2)] $target = '.',
    [Parameter(Position = 3)] $SessionName = 'CMSLCimSession'
  )

  Write-Verbose "Creating new CimSession (Protocol= $Protocol, Computer=$Target)"
  $opts = New-CimSessionOption -Protocol $Protocol

  $params = @{
    Name = $SessionName
    SkipTestConnection = $SkipTestConnection
    SessionOption = $opts
  }
  if ($Target -and ($Target -ne ".")) {
    $params.Add("ComputerName",$target)
  }
  New-CimSession @params

}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Set-HPPrivateBIOSSettingsList {
  [CmdletBinding()]
  param(
    [System.Collections.Generic.List[SureAdminSetting]]$settingsList,
    [string]$Password,
    [string]$ComputerName = ".",
    $ErrorHandling = 2,
    [CimSession]$CimSession,
    [switch]$NoSummary
  )

  $failedToSet = 0

  if (-not $CimSession) {
    $CimSession = newHPCimSession -Target $ComputerName
  }

  $counter = @(0,0,0,0,0)
  foreach ($setting in $SettingsList) {
    $counter[0]++
    $refParameter = 0

    $params = @{
      Setting = $setting
      ErrorHandling = $ErrorHandling
      CimSession = $CimSession
      Password = $Password
      SingleSettingFailCounter = [ref]$refParameter
    }

    $c = Invoke-HPPrivateSetSetting @params -Verbose:$VerbosePreference
    $failedToSet += $refParameter

    $counter[1] += $c[0]
    $counter[2] += $c[1]
    $counter[3] += $c[2]
  }


  if ($counter -and (-not $NoSummary.IsPresent)) {
    $summary = "Total: $($counter[0]), not found: $($counter[2]), different but read-only: $($counter[1]), already set: $($counter[3])"
    Write-Output $summary
  }

  if ($ErrorHandling -eq 1) {
    if ($failedToSet -eq 0) {
      return 0
    }
    else {
      return 13
    }
  }
}


<#
.SYNOPSIS
  This is a private command for internal use only

.DESCRIPTION
  This is a private command for internal use only

.EXAMPLE

.NOTES
  - This is a private command for internal use only
#>
function Set-HPPrivateBIOSSettingsListPayload {
  [CmdletBinding()]
  param(
    [Parameter(ParameterSetName = 'Payload',Position = 0,Mandatory = $true,ValueFromPipeline = $true)]
    [string]$Payload,
    $ErrorHandling = 2
  )

  [System.Collections.Generic.List[SureAdminSetting]]$settingsList = Get-HPPrivateSettingsFromPayload -Content $Payload

  $params = @{
    SettingsList = $settingsList
    ErrorHandling = $ErrorHandling
  }
  Set-HPPrivateBIOSSettingsList @params -Verbose:$VerbosePreference
}

# Internal function to check if authentication is required for BIOS update without the need to check the "BIOS Update Credential Policy" BIOS setting 
# True means authentication is required
# False means authentication is not required
function Test-HPAuthRequired {
  [CmdletBinding()]
  param(
    [ValidateSet("Upgrade","Downgrade")]
    [string]$BiosUpdateType = "Upgrade"
  )

  if (-not (Get-HPBIOSSetupPasswordIsSet) -and -not (Get-HPPrivateIsSureAdminEnabled)) {
    Write-Verbose "Both BIOS setup password and Sure Admin are not set. No authentication is required."
    return $false
  }

  if($BiosUpdateType -eq "Downgrade") {
    try {
      Write-Verbose "Checking if authentication is required for downgrade"
      $mi_result = 0
      switch (Test-HPOSBitness) {
        32 { $result = [DfmNativeBios]::auth_required_for_downgrade32([ref]$mi_result) }
        64 { $result = [DfmNativeBios]::auth_required_for_downgrade64([ref]$mi_result) }
      }
      Test-HPPrivateCustomResult -result 0x80000711 -Category 0x02 -mi_result $mi_result
    }
    catch [System.Management.Automation.MethodInvocationException]
    {
      throw "Could not find support library: $($_.Exception.Message)"
    }
  }
  else { # Upgrade
    try {
      Write-Verbose "Checking if authentication is required for upgrade"
      $mi_result = 0
      switch (Test-HPOSBitness) {
        32 { $result = [DfmNativeBios]::auth_required_for_upgrade32([ref]$mi_result) }
        64 { $result = [DfmNativeBios]::auth_required_for_upgrade64([ref]$mi_result) }
      }
      Test-HPPrivateCustomResult -result 0x80000711 -Category 0x02 -mi_result $mi_result
    }
    catch [System.Management.Automation.MethodInvocationException]
    {
      throw "Could not find support library: $($_.Exception.Message)"
    }
  }

  # the private WMI call indicates that 0 means prompt/auth required and 1 means no prompt/no auth required
  # for easier comprehension, we will return the opposite interpretation
  return -not [boolean]$result
}

# SIG # Begin signature block
