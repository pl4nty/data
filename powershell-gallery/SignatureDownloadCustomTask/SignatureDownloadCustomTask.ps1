<#PSScriptInfo

.VERSION 
    1.4

.GUID 
    55aaa5a7-4b42-4c28-b5d5-ba49a2df0181

.AUTHOR 
    Windows Defender Team

.COMPANYNAME 
    Microsoft Corporation

.COPYRIGHT 
    Copyright (C) Microsoft Corporation. All rights reserved.

.TAGS
    WindowsDefender,SignatureDownload

.LICENSEURI 

.PROJECTURI 

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES


#>

<# 

.DESCRIPTION
   It is crucial to keep antimalware definitions up-to-date to maintain optimal protection. Configuring VMs and VM hosts to stay up-to-date with antimalware definitions correctly can help
   avoid increased network bandwidth consumption and out of date AM definitions; misconfigurations can result in decreased usability of the VM and/or decreased protection from malware.

   This script simplifies the setting up of antimalware definitions for VMs and VM hosts. It allows VMs that don't have Internet connectivity or Windows Update (WU) connectivity to have
   up-to-date definitions.

   It does this by enabling the VM to pull from a UNC share, which is updated by the VM-host. This also results in overall network bandwidth savings as the antimalware definitions are
   downloaded only once for the VMs.

   The admin must select always run option or import the certificate and add the certificate to trusted publisher list.
   
   If you get an error trying to run 'create task', it is likely because the command line arguments tip over the max limit. Please place the script in a shortened path location and try again.

#> 


<#  
.SYNOPSIS  
    This script allows admins to create scheduled tasks on a Server host that would download the signatures regularly onto a specified share.
    The VMs can then be configured via a policy (not part of this script) to pick up the signatures from the share instead of directly downloading them from ADL or WU.
.NOTES  
    File Name  : SignatureDownloadCustomTask.ps1
    Author     : Windows Defender Team
    Requires   : PowerShell V3
    Note       : (1) Messages from this script will be logged to %windir%\Temp\DefenderSignatureDownloadTask.log.
                 (2) To download all the definitions, a customer must create 4 tasks:
                        X86 delta
                        X86 full
                        X64 delta
                        X64 full
                     We create the tasks separately so that admins can control the frequency of the delta versus the full downloads.
                     NIS sigs are generally small compared to the others, and hence are downloaded with all of these tasks.
                  (3) Ideally, the root destination folder should be the same for all the tasks with x86/x64 sub-folders so that it is easier to configure the UNC signature
                      source on the VMs.
                  (4) Requires admin rights to run.

.IMPORTANT-REMARKS
               : -scriptPath. Please make sure that this is a protected path. Otherwise a non-admin could replace the script file and have the task scheduler run it for them.
                              The task does however launch powershell with a flag to enforce running signed script only.
                              Also, the length of this cannot be greater than 150 characters.
               : -hoursInterval. If this is passed, the task will be created for hour-based intervals instead of day-based intervals.
.EXAMPLES  
    To create a task that downloads delta x86 signatures once every 2 days to a directory called D:\Share\Test, and assuming that this scripts resides in C:\Windows\Protected
        SignatureDownloadCustomTask.ps1 -action create -arch x86 -isDelta $true -destDir D:\Share\Test -scriptPath C:\Windows\Protected\SignatureDownloadCustomTask.ps1 -daysInterval 2
    To delete the above task
        SignatureDownloadCustomTask.ps1 -action delete -arch x86 -isDelta $true
    To run the task manually [JFYI, the scheduled task should take care of it anyways]
        SignatureDownloadCustomTask.ps1 -action run -arch x86 -isDelta $true -destDir D:\Share\Test
#>

param
(
    [parameter(Position=0, Mandatory=$true, HelpMessage="Action to do.")]
    [ValidateSet("create","delete","run")] 
    [string]$action,

    [parameter(Position=1, Mandatory=$true, HelpMessage="Architecture of the required signature package.")]
    [ValidateSet("x86","x64","arm")] 
    [string]$arch,

    [parameter(Position=2, Mandatory=$true, HelpMessage="False (0) - Task deals with full signature package, True (1) - Task deals with delta signature package")]
    [ValidateRange($False,$True)]
    [bool]$isDelta,

    [parameter(Mandatory=$false, HelpMessage="The destination directory where the sigs will be downloaded to.")]
    [string]$destDir,

    [parameter(Mandatory=$false, HelpMessage="The full path to where this script file resides.")]
    [string]$scriptPath,

    [parameter(Mandatory=$false, HelpMessage="The frequency desired for this task (in number of days).")]
    [ValidateRange(1, 365)]
    [int]$daysInterval = 1,

    [parameter(Mandatory=$false, HelpMessage="The frequency desired for this task if it has to be run multiple times per day (in number of hours).")]
    [ValidateRange(1, 23)]
    [int]$hoursInterval = 0
)

# Flushes the log file if it is bigger than 100 KB.
Function FlushIfTooBig-LogFile()
{
    [string]$path = Join-Path ($env:windir) "TEMP\DefenderSignatureDownloadTask.log"
    if (Test-Path $path)
    {
        $file = Get-Item $path    
        if ($file.Length -gt 100KB)
        {
            '' | Out-File $file
        }
    }
    else
    {
        New-Item $path -type file
        Write-Output 'Log file created.'
    }
}

# Appends a message to %windir%\Temp\DefenderSignatureDownloadTask.log with the time stamp.
Function Log-Message([string]$message)
{
    Write-Output $message
    [string]$path = Join-Path ($env:windir) "TEMP\DefenderSignatureDownloadTask.log"
    $date = Get-Date
    $date | Out-File $path -Append
    $message | Out-File $path -Append
    '----------End of message----------' | Out-File $path -Append
}

# Downloads file from a given URL.
Function Download-File([string]$url, [string]$targetFile)
{
    [System.Net.WebClient]$webClient = New-Object -TypeName System.Net.WebClient
    [System.Uri]$uri = New-Object -TypeName System.Uri -ArgumentList $url
    $webClient.DownloadFile($uri, $targetFile)
}

# Gets the specified registry value related to signatures.
Function Get-SignatureRegistryValue([string]$name) 
{
    [string]$path
    if ((Test-Path -Path 'HKLM:\SOFTWARE\Microsoft\Microsoft Antimalware') -And ([System.Environment]::OSVersion.Version.Major -lt 10))
    {
        $path = 'HKLM:\SOFTWARE\Microsoft\Microsoft Antimalware\Signature Updates'
    }
    else
    {
        $path = 'HKLM:\SOFTWARE\Microsoft\Windows Defender\Signature Updates'
    }

    $key = Get-Item -LiteralPath $path
    return $key.GetValue($name, $null)
}

# Gets the URL to download AM delta sigs. We use the hosts' AM engine and base sig version for the URL.
Function Get-AmDeltaSigUrl([string]$arch)
{
    [string]$engineVersionValue = Get-SignatureRegistryValue 'EngineVersion'
    [string]$avVersionValue = Get-SignatureRegistryValue 'AVSignatureBaseVersion'
    [string]$asVersionValue = Get-SignatureRegistryValue 'ASSignatureBaseVersion'
    [string]$deltaSigPath = [string]::Format("http://go.microsoft.com/fwlink/?LinkID=121721&clcid=0x409&arch={0}&eng={1}&avdelta={2}&asdelta={3}",
                                             $arch.Trim(),
                                             $engineVersionValue.Trim(),
                                             $avVersionValue.Trim(),
                                             $asVersionValue.Trim())
    return $deltaSigPath
}

# Gets the URL to download AM full sigs.
Function Get-AmFullSigUrl([string]$arch)
{
    [string]$fullSigPath = [string]::Format("http://go.microsoft.com/fwlink/?LinkID=121721&clcid=0x409&arch={0}", $arch.Trim())
    return $fullSigPath
}

# Gets the URL to download NIS sigs.
Function Get-NisSigUrl([string]$arch)
{
    [string]$nisSigPath = [string]::Format("http://go.microsoft.com/fwlink/?LinkID=260974&clcid=0x409&NRI=true&arch={0}", $arch.Trim())
    return $nisSigPath   
}

# Downloads AM and NIS sigs.
Function Run-Task([string]$arch, [bool]$isDelta, [string]$destDir)
{
    # Download AM sigs.
    [string]$amSigFileName
    [string]$url
    [string]$packageType
    if ($isDelta)
    {
        $packageType = 'Delta'
        $amSigFileName = 'mpam-d.exe'
        $url = Get-AmDeltaSigUrl $arch
    }
    else
    {
        $packageType = 'Full'
        $amSigFileName = 'mpam-fe.exe'
        $url = Get-AmFullSigUrl $arch
    }

    [string]$fullDestPath = Join-Path $destDir $amSigFileName
    Download-File $url $fullDestPath # Please note that Download-File can throw an error if ADL has no file to offer for the config we pass.
    [string]$message = 'Successfully ran task to download ' + $packageType + ' AM sigs of arch ' + $arch + ' to ' + $fullDestPath
    Log-Message $message

    # Download NIS sigs.
    [string]$nisSigFileName = 'nis_full.exe'
    [string]$fullNisDestPath = Join-Path $destDir $nisSigFileName
    [string]$nisUrl = Get-NisSigUrl $arch
    Download-File $nisUrl $fullNisDestPath
    [string]$nisMessage = 'Successfully ran task to download NIS sigs of arch ' + $arch + ' to ' + $fullNisDestPath
    Log-Message $nisMessage    
}

# Gets the name of the signature download scheduled task, based on arch and package type (delta/full).
Function Get-TaskName([string]$arch, [bool]$isDelta)
{
    [string]$packageType
    if ($isDelta)
    {
        $packageType = 'Delta'
    }
    else
    {
        $packageType = 'Full'
    }

    [string]$taskName = 'Windows Defender Custom Task for ' + $arch + $packageType + ' Signature Download'
    [string]$taskFullName = [string]::Format("\Microsoft\Windows\Windows Defender\{0}", $taskName)

    return $taskFullName
}

# Creates a scheduled task that would download the signatures regularly onto the specified share.
Function Create-Task([string]$scriptPath, [string]$arch, [bool]$isDelta, [string]$destDir, [int]$daysInterval, [int]$hoursInterval)
{
    [string]$schedule
    [int]$interval = 1
    if ($hoursInterval -eq 0)    # if this is not set, then use day-based interval for the scheduled task. Otherwise if it is set, use hour-based interval.
    {
        $schedule = 'DAILY'
        $interval = $daysInterval
    }
    else
    {
        $schedule = 'HOURLY'
        $interval = $hoursInterval
    }

    [string]$scriptCommand = '\\\"' + $scriptPath + '\\\"' + ' -action run' + ' -arch ' + $arch + ' -isDelta $' + $isDelta + ' -destDir ' + $destDir        
    [string]$schTasksPath = Join-Path ($env:windir) "system32\schtasks.exe"    # Needs to run downlevel as well; hence not using the Win8.1+ specific ScheduleTask* helpers.
    [string]$taskFullName = Get-TaskName $arch $isDelta
    $taskFullName = $taskFullName.Trim()

    [string]$fullPathToPowerShellExe = Join-Path $PsHome powershell.exe
    [string]$taskProgramArg = $fullPathToPowerShellExe + ' -Noprofile -ExecutionPolicy AllSigned -Command ' + '\"& ' + $scriptCommand + '\"'
    $schTasksProcess = Start-Process -FilePath "$schTasksPath" -ArgumentList "/create /tn ""$taskFullName"" /tr ""$taskProgramArg"" /ru ""NT AUTHORITY\SYSTEM"" /sc ""$schedule"" /MO ""$interval"" /NP /F /RL ""LIMITED""" -Wait -PassThru -NoNewWindow
    if ($schTasksProcess.ExitCode -ne 0)
    {
        throw "Error: Create task failed. Check Event log for more details."
    }

    [string]$message = 'Successfully created task ' + $taskFullName
    Log-Message $message
}

# Deletes specified scheduled task.
Function Delete-Task([string]$arch, [bool]$isDelta)
{
    [string]$schTasksPath = Join-Path ($env:windir) "system32\schtasks.exe"
    [string]$taskFullName = Get-TaskName $arch $isDelta
    $taskFullName = $taskFullName.Trim()

    $schTasksProcess = Start-Process -FilePath "$schTasksPath" -ArgumentList "/delete /tn ""$taskFullName"" /f" -Wait -PassThru -NoNewWindow
    if ($schTasksProcess.ExitCode -ne 0)
    {
        throw "Error: Create task failed. Check Event log for more details."
    }

    [string]$message = 'Successfully deleted task ' + $taskFullName
    Log-Message $message
}

# Main
try
{
    FlushIfTooBig-LogFile

    Log-Message 'Script started.'

    # Some additional parameter validation for specific actions.
    if (($action.ToLower() -eq 'create') -OR ($action.ToLower() -eq 'run'))
    {
        if (-NOT (Test-Path $destDir -PathType 'Container')) 
        { 
           throw "$($destDir) is not a valid folder" 
        }
    }

    if ($action.ToLower() -eq 'create')
    {
        if (-NOT (Test-Path $scriptPath -PathType 'Leaf')) 
        { 
           throw "$($scriptPath) is not a valid file" 
        }
    }

    # Execute specified action.
    if ($action.ToLower() -eq 'create')
    {
        Create-Task $scriptPath $arch $isDelta $destDir $daysInterval $hoursInterval
    }
    elseif ($action.ToLower() -eq 'delete')
    {
        Delete-Task $arch $isDelta
    }
    else # ($action.ToLower() -eq 'run')
    {
        Run-Task $arch $isDelta $destDir
    }

    Log-Message 'Script completed.'
}
catch [System.Exception]
{
    Log-Message $Error
}
# SIG # Begin signature block
