# 
#  Copyright 2018-2024 HP Development Company, L.P.
#  All Rights Reserved.
# 
# NOTICE:  All information contained herein is, and remains the property of HP Development Company, L.P.
# 
# The intellectual and technical concepts contained herein are proprietary to HP Development Company, L.P
# and may be covered by U.S. and Foreign Patents, patents in process, and are protected by 
# trade secret or copyright law. Dissemination of this information or reproduction of this material
# is strictly forbidden unless prior written permission is obtained from HP Development Company, L.P.

using namespace HP.CMSLHelper

# CMSL is normally installed in C:\Program Files\WindowsPowerShell\Modules
# but if installed via PSGallery and via PS7, it is installed in a different location
if (Test-Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll") {
  Add-Type -Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll"
}
else{
  Add-Type -Path "$PSScriptRoot\..\..\HP.Private\1.8.1\HP.CMSLHelper.dll"
}


enum LogType{
  Simple
  CMTrace
}

enum LogSeverity{
  Information = 1
  Warning = 2
  Error = 3
}

function Get-HPPrivateThreadID { [Threading.Thread]::CurrentThread.ManagedThreadId }
function Get-HPPrivateUserIdentity { [System.Security.Principal.WindowsIdentity]::GetCurrent().Name }
function Get-HPPrivateLogVar { $Env:HPCMSL_LOG_FORMAT }

<#
.SYNOPSIS
  Sends a message to a syslog server

.DESCRIPTION
  This command forwards data to a syslog server. This command currently supports UDP (default) and TCP connections. For more information, see RFC 5424 in the 'See also' section.

.PARAMETER message
  Specifies the message to send

.PARAMETER severity
  Specifies the severity of the message. If not specified, the severity defaults to 'Informational'.

.PARAMETER facility
  Specifies the facility of the message. If not specified, the facility defaults to 'User Message'. 

.PARAMETER clientname
  Specifies the client name. If not specified, this command uses the current computer name.

.PARAMETER timestamp
  Specifies the event time stamp. If not specified, this command uses the current time.

.PARAMETER port
  Specifies the target port. If not specified and HPSINK_SYSLOG_MESSAGE_TARGET_PORT is not set, this command uses port 514 for both TCP and UDP.

.PARAMETER tcp
  If specified, this command uses TCP instead of UDP. Default is UDP. Switching to TCP may generate additional traffic but allows the protocol to acknowledge delivery.

.PARAMETER tcpframing
  Specifies octet-counting or non-transparent-framing TCP framing. This parameter only applies if the -tcp parameter is specified. Default value is octet-counting unless HPSINK_SYSLOG_MESSAGE_TCPFRAMING is specified. For more information, see RFC 6587 in the "See also" section.

.PARAMETER maxlen
  Specifies maximum length (in bytes) of message that the syslog server accepts. Common sizes are between 480 and 2048 bytes. Default is 2048 if not specified and HPSINK_SYSLOG_MESSAGE_MAXLEN is not set.

.PARAMETER target
  Specifies the target computer on which to perform this operation. Local computer is assumed if not specified and HPSINK_SYSLOG_MESSAGE_TARGET is not set.

.PARAMETER PassThru
  If specified, this command sends the message to the pipeline upon completion and any error in the command is non-terminating.


.NOTES

  This command supports the following environment variables. These overwrite the defaults documented above.

  - HPSINK_SYSLOG_MESSAGE_TARGET_PORT: override default target port
  - HPSINK_SYSLOG_MESSAGE_TCPFRAMING: override TCP Framing format
  - HPSINK_SYSLOG_MESSAGE_MAXLEN: override syslog message max length
  - HPSINK_SYSLOG_MESSAGE_TARGET: override host name of the syslog server


  Defaults can be configured via the environment. This affects all related commands. For example, when applying them to eventlog-related commands, all eventlog-related commands are affected.

  In the following example, the HPSINK_EVENTLOG_MESSAGE_TARGET and HPSINK_EVENTLOG_MESSAGE_SOURCE variables affect both the Register-EventLogSink and Send-ToEventLog commands.

  ```PowerShell
  $ENV:HPSINK_EVENTLOG_MESSAGE_TARGET="remotesyslog.mycompany.com"
  $ENV:HPSINK_EVENTLOG_MESSAGE_SOURCE="mysource"
  Register-EventLogSink
  "hello" | Send-ToEventLog
  ```


.INPUTS
  The message can be piped to this command, rather than provided via the -message parameter.

.OUTPUTS
  If the -PassThru parameter is specified, the original message is returned. This allows chaining multiple SendTo-XXX commands.

.EXAMPLE
   "hello" | Send-ToSyslog -tcp -server mysyslogserver.mycompany.com

   This sends "hello" to the syslog server on mysyslogserver.mycompany.com via TCP. Alternately, the syslog server could be set in the environment variable HPSINK_SYSLOG_MESSAGE_TARGET.

.LINK
    [RFC 5424 - "The Syslog Protocol"](https://tools.ietf.org/html/rfc5424)

.LINK
  [RFC 6587 - "Transmission of Syslog Messages over TCP"](https://tools.ietf.org/html/rfc6587)

.LINK
  [Send-ToEventlog](https://developers.hp.com/hp-client-management/doc/Send-ToEventLog)


#>
function Send-ToSyslog
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Send-ToSyslog")]
  param
  (
    [ValidateNotNullOrEmpty()][Parameter(Position = 0,ValueFromPipeline = $True,Mandatory = $True)] $message,
    [Parameter(Position = 1,Mandatory = $false)] [syslog_severity_t]$severity = [syslog_severity_t]::informational,
    [Parameter(Position = 2,Mandatory = $false)] [syslog_facility_t]$facility = [syslog_facility_t]::user_message,
    [Parameter(Position = 3,Mandatory = $false)] [string]$clientname,
    [Parameter(Position = 4,Mandatory = $false)] [string]$timestamp,
    [Parameter(Position = 5,Mandatory = $false)] [int]$port = $HPSINK:HPSINK_SYSLOG_MESSAGE_TARGET_PORT,
    [Parameter(Position = 6,Mandatory = $false)] [switch]$tcp,
    [ValidateSet("octet-counting","non-transparent-framing")][Parameter(Position = 7,Mandatory = $false)] [string]$tcpframing = $ENV:HPSINK_SYSLOG_MESSAGE_TCPFRAMING,
    [Parameter(Position = 8,Mandatory = $false)] [int]$maxlen = $ENV:HPSINK_SYSLOG_MESSAGE_MAXLEN,
    [Parameter(Position = 9,Mandatory = $false)] [switch]$PassThru,
    [Parameter(Position = 10,Mandatory = $false)] [string]$target = $ENV:HPSINK_SYSLOG_MESSAGE_TARGET
  )

  # Create a UDP Client Object
  $tcpclient = $null
  $use_tcp = $false


  #defaults (change these in environment)
  if ($target -eq $null -or $target -eq "") { throw "parameter $target is required" }
  if ($tcpframing -eq $null -or $tcpframing -eq "") { $tcpframing = "octet-counting" }
  if ($port -eq 0) { $port = 514 }
  if ($maxlen -eq 0) { $maxlen = 2048 }


  if ($tcp.IsPresent -eq $false) {
    switch ([int]$ENV:HPSINK_SYSLOG_MESSAGE_USE_TCP) {
      0 { $use_tcp = $false }
      1 { $use_tcp = $true }
    }
  }
  else { $use_tcp = $tcp.IsPresent }


  Write-Verbose "Sending message to syslog server"
  if ($use_tcp) {
    Write-Verbose "TCP Connection to $target`:$port"
    $client = New-Object System.Net.Sockets.TcpClient
  }
  else
  {
    Write-Verbose "UDP Connection to $target`:$port"
    $client = New-Object System.Net.Sockets.UdpClient
  }

  try {
    $client.Connect($target,$port)
  }
  catch {
    if ($_.Exception.innerException -ne $null) {
      Write-Error $_.Exception.innerException.Message -Category ConnectionError -ErrorAction Stop
    } else {
      Write-Error $_.Exception.Message -Category ConnectionError -ErrorAction Stop
    }
  }

  if ($use_tcp -and -not $client.Connected)
  {
    $prefix = "udp"
    if ($use_tcp) { $prefix = $tcp }
    throw "Could not connect to syslog host $prefix`://$target`:$port"
  }


  Write-Verbose "Syslog faciliy=$($facility.value__), severity=$($severity.value__)"

  $priority = ($facility.value__ * 8) + $severity.value__
  Write-Verbose "Priority is $priority"

  if (($clientname -eq "") -or ($clientname -eq $null)) {
    Write-Verbose "Defaulting to client = $($ENV:computername)"
    $clientname = $env:computername
  }

  if (($timestamp -eq "") -or ($timestamp -eq $null)) {
    $timestamp = Get-Date -Format "yyyy:MM:dd:-HH:mm:ss zzz"
    Write-Verbose "Defaulting to timestamp = $timestamp"
  }

  $msg = "<{0}>{1} {2} {3}" -f $priority,$timestamp,$hostname,$message

  Write-Verbose ("Sending the message: $msg")
  if ($use_tcp) {
    Write-Verbose ("Sending via TCP")


    if ($msg.Length -gt $maxlen) {
      $maxlen = $maxlen - ([string]$maxlen).Length
      Write-Verbose ("This message has been truncated because maximum effective length is $maxlen but the message is  $($msg.length) ")
      $msg = $msg.substring(0,$maxlen - ([string]$maxlen).Length)
    }

    switch ($tcpframing) {
      "octet-counting" {
        Write-Verbose "Encoding TCP payload with 'octet-counting'"
        $encoded = '{0} {1}' -f $msg.Length,$msg
        $bytes = [System.Text.Encoding]::ASCII.GetBytes($encoded)
      }

      "non-transparent-framing" {
        Write-Verbose "Encoding with 'non-transparent-framing'"
        $encoded = '{0}{1}' -f $msg.Length,$msg
        $bytes = [System.Text.Encoding]::ASCII.GetBytes($encoded)
      }
    }

    try {
      [void]$client.getStream().Write($bytes,0,$bytes.Length)
    }
    catch {
      throw ("Could not send syslog message: $($_.Exception.Message)")
    }
  }
  else
  {

    Write-Verbose ("Sending via UDP")
    try {
      $bytes = [System.Text.Encoding]::ASCII.GetBytes($msg)
      if ($bytes.Length -gt $maxlen) {
        Write-Verbose ("This message has been truncated, because maximum length is $maxlen but the message is  $($bytes.length) ")
        $bytes = $bytes[0..($maxlen - 1)]
      }
      [void]$client.Send($bytes,$bytes.Length)
    }
    catch {
      if (-not $PassThru.IsPresent) {
        throw ("Could not send syslog message: $($_.Exception.Message)")
      }
      else
      {
        Write-Error -Message $_.Exception.Message -ErrorAction Continue
      }

    }
  }

  Write-Verbose "Send complete"
  $client.Close();
  if ($PassThru) { return $message }
}


<#
.SYNOPSIS
  Registers a source in an event log

.DESCRIPTION
  This command registers a source in an event log. must be executed before sending messages to the event log via the Send-ToEventLog command. 
  The source must match the source in the Send-ToEventLog command. By default, it is assumed that the source is 'HP-CSL'.

  This command can be unregistered using the Unregister-EventLogSink command. 

.PARAMETER logname
  Specifies the log section in which to register this source

.PARAMETER source
  Specifies the event log source that will be used when logging.

  The source can also be specified via the HPSINK_EVENTLOG_MESSAGE_SOURCE environment variable.

.PARAMETER target
  Specifies the target computer on which to perform this command. Local computer is assumed if not specified, unless environment variable HPSINK_EVENTLOG_MESSAGE_TARGET is defined.

  Important: the user identity running the PowerShell script must have permissions to write to the remote event log.

.NOTES
  This command reads the following environment variables for setting defaults:

    - HPSINK_EVENTLOG_MESSAGE_SOURCE: override default source name
    - HPSINK_EVENTLOG_MESSAGE_LOG: override default message log name
    - HPSINK_EVENTLOG_MESSAGE_TARGET: override event log server name

.LINK
  [Unregister-EventLogSink](https://developers.hp.com/hp-client-management/doc/Unregister-EventLogSink)

.LINK
  [Send-ToEventLog](https://developers.hp.com/hp-client-management/doc/Send-ToEventLog)

.EXAMPLE
  Register-EventLogSink
#>
function Register-EventLogSink
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Register-EventLogSink")]
  param
  (
    [Parameter(Position = 0,Mandatory = $false)] [string]$logname = $ENV:HPSINK_EVENTLOG_MESSAGE_LOG,
    [Parameter(Position = 1,Mandatory = $false)] [string]$source = $ENV:HPSINK_EVENTLOG_MESSAGE_SOURCE,
    [Parameter(Position = 2,Mandatory = $false)] [string]$target = $ENV:HPSINK_EVENTLOG_MESSAGE_TARGET
  )


  #defaults (change these in environment)
  if ($source -eq $null -or $source -eq "") { $source = "HP-CSL" }
  if ($logname -eq $null -or $logname -eq "") { $logname = "Application" }
  if ($target -eq $null -or $target -eq "") { $target = "." }


  Write-Verbose "Registering source $logname / $source"
  $params = @{
    LogName = $logname
    source = $source
  }

  if ($target -ne ".") { $params.Add("ComputerName",$target) }
  New-EventLog @params
}

<#
.SYNOPSIS
   Unregisters a source registered by the Register-EventLogSink command 

.DESCRIPTION
  This command removes a registration that was previously registered by the Register-EventLogSink command. 

Note:
Switching between formats changes the file encoding. The 'Simple' mode uses unicode encoding (UTF-16) while the 'CMTrace' mode uses UTF-8. This is partly due to historical reasons
(default encoding in UTF1-16 and existing log is UTF-16) and partly due to limitations in CMTrace tool, which seems to have trouble with UTF-16 in some cases. 

As a result, it is important to start with a new log when switching modes. Writing UTF-8 to UTF-16 files or vice versa will cause encoding and display issues.  

.PARAMETER source  
  Specifies the event log source that was registered via the Register-EventLogSink command. The source can also be specified via the HPSINK_EVENTLOG_MESSAGE_SOURCE environment variable.

.PARAMETER target
  Specifies the target computer on which to perform this command. Local computer is assumed if not specified, unless environment variable
  HPSINK_EVENTLOG_MESSAGE_TARGET is defined.

  Important: the user identity running the PowerShell script must have permissions to write to the remote event log.

.NOTES
    This command reads the following environment variables for setting defaults:

  - HPSINK_EVENTLOG_MESSAGE_SOURCE: override default source name
  - HPSINK_EVENTLOG_MESSAGE_TARGET: override event log server name

.LINK
  [Register-EventLogSink](https://developers.hp.com/hp-client-management/doc/Register-EventLogSink)

.LINK
  [Send-ToEventLog](https://developers.hp.com/hp-client-management/doc/Send-ToEventLog)

.EXAMPLE
  Unregister-EventLogSink
#>
function Unregister-EventLogSink
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Unregister-EventLogSink")]
  param
  (
    [Parameter(Position = 0,Mandatory = $false)] [string]$source = $ENV:HPSINK_EVENTLOG_MESSAGE_SOURCE,
    [Parameter(Position = 1,Mandatory = $false)] [string]$target = $ENV:HPSINK_EVENTLOG_MESSAGE_TARGET
  )

  #defaults (change these in environment)
  if ($source -eq $null -or $source -eq "") { $source = "HP-CSL" }
  if ($target -eq $null -or $target -eq "") { $target = "." }


  Write-Verbose "Unregistering source $source"
  $params = @{
    source = $source
  }

  if ($target -ne ".") { $params.Add("ComputerName",$target) }
  Remove-EventLog @params
}

<#
.SYNOPSIS
  Sends a message to an event log

.DESCRIPTION
  This command sends a message to an event log. 

  The source should be initialized with the Register-EventLogSink command to register the source name prior to using this command. 

.PARAMETER id
  Specifies the event id that will be registered under the 'Event ID' column in the event log. Default value is 0. 

.PARAMETER source
  Specifies the event log source that will be used when logging. This source should be registered via the Register-EventLogSink command. 

  The source can also be specified via the HPSINK_EVENTLOG_MESSAGE_SOURCE environment variable.

.PARAMETER message
  Specifies the message to log. This parameter is required.

.PARAMETER severity
  Specifies the severity of the message. If not specified, the severity is set as 'Information'.

.PARAMETER category
  Specifies the category of the message. The category shows up under the 'Task Category' column. If not specified, it is 'General', unless environment variable HPSINK_EVENTLOG_MESSAGE_CATEGORY is defined.

.PARAMETER logname
  Specifies the log in which to log (e.g. Application, System, etc). If not specified, it will log to Application, unless environment variable HPSINK_EVENTLOG_MESSAGE_LOG is defined.

.PARAMETER rawdata
  Specifies any raw data to add to the log entry 

.PARAMETER target
  Specifies the target computer on which to perform this operation. Local computer is assumed if not specified, unless environment variable HPSINK_EVENTLOG_MESSAGE_TARGET is defined.

  Important: the user identity running the PowerShell script must have permissions to write to the remote event log.

.PARAMETER PassThru
  If specified, this command sends the message to the pipeline upon completion and any error in the command is non-terminating.

.EXAMPLE 
    "hello" | Send-ToEventLog 

.NOTES
    This command reads the following environment variables for setting defaults.

  - HPSINK_EVENTLOG_MESSAGE_SOURCE: override default source name
  - HPSINK_EVENTLOG_MESSAGE_CATEGORY: override default category id
  - HPSINK_EVENTLOG_MESSAGE_LOG: override default message log name
  - HPSINK_EVENTLOG_MESSAGE_TARGET: override event log server name

  Defaults can be configured via the environment. This affects all related commands. For example, when applying them to eventlog-related commands, all eventlog-related commands are affected.

  In the following example, the HPSINK_EVENTLOG_MESSAGE_TARGET and HPSINK_EVENTLOG_MESSAGE_SOURCE variables affect both the Register-EventLogSink and Send-ToEventLog commands.

  ```PowerShell
  $ENV:HPSINK_EVENTLOG_MESSAGE_TARGET="remotesyslog.mycompany.com"
  $ENV:HPSINK_EVENTLOG_MESSAGE_SOURCE="mysource"
  Register-EventLogSink
  "hello" | Send-ToEventLog
  ```


.LINK
  [Unregister-EventLogSink](https://developers.hp.com/hp-client-management/doc/Unregister-EventLogSink)

.LINK
  [Register-EventLogSink](https://developers.hp.com/hp-client-management/doc/Register-EventLogSink)

.LINK
  [Send-ToSyslog](https://developers.hp.com/hp-client-management/doc/Send-ToSyslog)


#>
function Send-ToEventLog
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Send-ToEventlog")]
  param
  (

    [Parameter(Position = 0,Mandatory = $false)] [string]$source = $ENV:HPSINK_EVENTLOG_MESSAGE_SOURCE,
    [Parameter(Position = 1,Mandatory = $false)] [int]$id = 0,
    [ValidateNotNullOrEmpty()][Parameter(Position = 2,ValueFromPipeline = $true,Mandatory = $True)] $message,
    [Parameter(Position = 3,Mandatory = $false)] [eventlog_severity_t]$severity = [eventlog_severity_t]::informational,
    [Parameter(Position = 4,Mandatory = $false)] [int16]$category = $ENV:HPSINK_EVENTLOG_MESSAGE_CATEGORY,
    [Parameter(Position = 5,Mandatory = $false)] [string]$logname = $ENV:HPSINK_EVENTLOG_MESSAGE_LOG,
    [Parameter(Position = 6,Mandatory = $false)] [byte[]]$rawdata = $null,
    [Parameter(Position = 7,Mandatory = $false)] [string]$target = $ENV:HPSINK_EVENTLOG_MESSAGE_TARGET,
    [Parameter(Position = 8,Mandatory = $false)] [switch]$PassThru
  )

  #defaults (change these in environment)
  if ($source -eq $null -or $source -eq "") { $source = "HP-CSL" }
  if ($logname -eq $null -or $logname -eq "") { $logname = "Application" }
  if ($target -eq $null -or $target -eq "") { $target = "." }

  Write-Verbose "Sending message (category=$category, id=$id) to eventlog $logname with source $source"
  $params = @{
    EntryType = $severity.value__
    Category = $category
    Message = $message
    LogName = $logname
    source = $source
    EventId = $id
  }


  if ($target -ne ".") {
    $params.Add("ComputerName",$target)
    Write-Verbose ("The target machine is remote ($target)")
  }

  if ($rawdata -ne $null) { $params.Add("RawData",$rawdata) }

  try {
    Write-EventLog @params
  }
  catch {
    if (-not $PassThru.IsPresent) {
      throw ("Could not send eventlog message: $($_.Exception.Message)")
    }
    else
    {
      Write-Error -Message $_.Exception.Message -ErrorAction Continue
    }
  }
  if ($PassThru) { return $message }
}




<#
.SYNOPSIS
   Writes a 'simple' LOG entry
   Private command. Do not export
#>
function Write-HPPrivateSimple {

  [CmdletBinding()]
  param
  (
    [Parameter(Mandatory = $True,Position = 0)]
    [LogSeverity]$Severity,
    [Parameter(Mandatory = $True,Position = 1)]
    [string]$Message,
    [Parameter(Mandatory = $True,Position = 2)]
    [string]$Component,
    [Parameter(Mandatory = $False,Position = 3)]
    [string]$File = $Null
  )
  $prefix = switch ($severity) {
    Error { " [ERROR] " }
    Warning { " [WARN ] " }
    default { "" }
  }

  if ($File) {
    if (-not [System.IO.Directory]::Exists([System.IO.Path]::GetDirectoryName($File)))
    {
      throw [System.IO.DirectoryNotFoundException]"Path not found: $([System.IO.Path]::GetDirectoryName($File))"
    }
  }

  $context = Get-HPPrivateUserIdentity

  $line = "[$(Get-Date -Format o)] $Context  - $Prefix $Message"
  if ($File) {
    $line | Out-File -Width 1024 -Append -Encoding unicode -FilePath $File
  }
  else {
    $line
  }

}

<#
.SYNOPSIS
   Writes a 'CMTrace' LOG entry
   Private command. Do not export
#>
function Write-HPPrivateCMTrace {
  [CmdletBinding()]
  param
  (
    [Parameter(Mandatory = $True,Position = 0)]
    [LogSeverity]$Severity,
    [Parameter(Mandatory = $True,Position = 1)]
    [string]$Message,
    [Parameter(Mandatory = $True,Position = 2)]
    [string]$Component,
    [Parameter(Mandatory = $False,Position = 3)]
    [string]$File

  )

  $line = "<![LOG[$Message]LOG]!>" + `
     "<time=`"$(Get-Date -Format "HH:mm:ss.ffffff")`" " + `
     "date=`"$(Get-Date -Format "M-d-yyyy")`" " + `
     "component=`"$Component`" " + `
     "context=`"$(Get-HPPrivateUserIdentity)`" " + `
     "type=`"$([int]$Severity)`" " + `
     "thread=`"$(Get-HPPrivateThreadID)`" " + `
     "file=`"`">"

  if ($File) {
    if (-not [System.IO.Directory]::Exists([System.IO.Path]::GetDirectoryName($File)))
    {
      throw [System.IO.DirectoryNotFoundException]"Path not found: $([System.IO.Path]::GetDirectoryName($File))"
    }
  }

  if ($File) {
    $line | Out-File -Append -Encoding UTF8 -FilePath $File -Width 1024
  }
  else {
    $line
  }

}




<#
.SYNOPSIS
  Sets the format used by the Write-Log* commands 

.DESCRIPTION
  This command sets the log format used by the Write-Log* commands. The two formats supported are simple (human readable) format and CMtrace format used by configuration manager.

  The format is stored in the HPCMSL_LOG_FORMAT environment variable. To set the default format without using this command, update the variable by setting it to either 'Simple' or 'CMTrace' ahead of time.

  The default format is 'Simple'. 

.PARAMETER Format
  Specifies the log format. The value must be one of the following values:
  - Simple: human readable
  - CMTrace: XML format used by the CMTrace tool

.EXAMPLE
  Set-HPCMSLLogFormat -Format CMTrace

.LINK
  [Write-LogInfo](https://developers.hp.com/hp-client-management/doc/Write-LogInfo)

.LINK
  [Write-LogWarning](https://developers.hp.com/hp-client-management/doc/Write-LogWarning)

.LINK
  [Write-LogError](https://developers.hp.com/hp-client-management/doc/Write-LogError)

.LINK
  [Get-HPCMSLLogFormat](https://developers.hp.com/hp-client-management/doc/Get-HPCMSLLogFormat)

#>
function Set-HPCMSLLogFormat
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Set-HPCMSLLogFormat")]
  param(
    [Parameter(Mandatory = $True,Position = 0)]
    [LogType]$Format
  )
  $Env:HPCMSL_LOG_FORMAT = $Format
  $Global:CmslLog = $Global:CmslLogType

  Write-Debug "Set log type to $($Global:CmslLog)"
}

<#
.SYNOPSIS
  Retrieves the format used by the log commands
  
.DESCRIPTION
  This command retrieves the configured log format used by the Write-Log* commands. This command returns the value of the HPCMSL_LOG_FORMAT environment variable or 'Simple' if the variable is not configured.

.PARAMETER Format
  Specifies the log format. The value must be one of the following values:
  - Simple: human readable
  - CMTrace: XML format used by the CMTrace tool

.EXAMPLE
  Get-HPCMSLLogFormat -Format CMTrace

.LINK
  [Write-LogInfo](https://developers.hp.com/hp-client-management/doc/Write-LogInfo)
.LINK
  [Write-LogWarning](https://developers.hp.com/hp-client-management/doc/Write-LogWarning)
.LINK  
  [Write-LogError](https://developers.hp.com/hp-client-management/doc/Write-LogError)
.LINK  
  [Set-HPCMSLLogFormat](https://developers.hp.com/hp-client-management/doc/Set-HPCMSLLogFormat)

#>
function Get-HPCMSLLogFormat
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Get-HPCMSLLogFormat")]
  param()

  if (-not $Global::CmslLog)
  {
    $Global:CmslLog = Get-HPPrivateLogVar
  }

  if (-not $Global:CmslLog)
  {
    $Global:CmslLog = 'Simple'
  }

  Write-Verbose "Configured log type is $($Global:CmslLog)"

  switch ($Global:CmslLog)
  {
    'CMTrace' { 'CMTrace' }
    Default { 'Simple' }
  }

}


<#
.SYNOPSIS
  Writes a 'warning' log entry
  
.DESCRIPTION
  This command writes a 'warning' log entry to default output or a specified file.

.PARAMETER Message
  Specifies the message to write

.PARAMETER Component
  Specifies a 'Component' tag for the message entry. Some log readers use this parameter to group messages. If not specified, the component tag is 'General'.
  This parameter is ignored in 'Simple' mode due to backwards compatibility reasons.

.PARAMETER File
  Specifies the file to update with the new log entry. If not specified, the log entry is written to the pipeline.

.EXAMPLE
  Write-LogWarning -Component "Repository" -Message "Something bad may have happened" -File myfile.log

.LINK
  [Write-LogInfo](https://developers.hp.com/hp-client-management/doc/Write-LogInfo)
.LINK  
  [Write-LogError](https://developers.hp.com/hp-client-management/doc/Write-LogError)
.LINK  
  [Get-HPCMSLLogFormat](https://developers.hp.com/hp-client-management/doc/Get-HPCMSLLogFormat)
.LINK  
  [Set-HPCMSLLogFormat](https://developers.hp.com/hp-client-management/doc/Set-HPCMSLLogFormat)

#>
function Write-LogWarning
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Write-LogWarning")]
  param(
    [Parameter(Mandatory = $True,Position = 0)]
    [string]$Message,
    [Parameter(Mandatory = $False,Position = 1)]
    [string]$Component = "General",
    [Parameter(Mandatory = $False,Position = 2)]
    [string]$File
  )
  if ($File) {
    $file = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($file)
  }
  switch (Get-HPCMSLLogFormat)
  {
    CMTrace {
      Write-HPPrivateCMTrace -Severity Warning -Message $Message -Component $Component -File $File
    }
    default {
      Write-HPPrivateSimple -Severity Warning -Message $Message -Component $Component -File $file
    }
  }


}


<#
.SYNOPSIS
  Writes an 'error' log entry
  
.DESCRIPTION
  This command writes an 'error' log entry to default output or a specified file.

.PARAMETER Message
  Specifies the message to write

.PARAMETER Component
  Specifies a 'Component' tag for the message entry. Some log readers use this parameter to group messages. If not specified, the component tag is 'General'.
  This parameter is ignored in 'Simple' mode due to backwards compatibility reasons.

.PARAMETER File
  Specifies the file to update with the new log entry. If not specified, the log entry is written to pipeline.

.EXAMPLE
  Write-LogError -Component "Repository" -Message "Something bad happened" -File myfile.log

.LINK
  [Write-LogInfo](https://developers.hp.com/hp-client-management/doc/Write-LogInfo)
.LINK  
  [Write-LogWarning](https://developers.hp.com/hp-client-management/doc/Write-LogWarning)
.LINK  
  [Get-HPCMSLLogFormat](https://developers.hp.com/hp-client-management/doc/Get-HPCMSLLogFormat)
.LINK  
  [Set-HPCMSLLogFormat](https://developers.hp.com/hp-client-management/doc/Set-HPCMSLLogFormat)
  
#>
function Write-LogError
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Write-LogError")]
  param(
    [Parameter(Mandatory = $True,Position = 0)]
    [string]$Message,
    [Parameter(Mandatory = $False,Position = 1)]
    [string]$Component = "General",
    [Parameter(Mandatory = $False,Position = 2)]
    [string]$File
  )

  if ($File) {
    $file = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($file)
  }
  switch (Get-HPCMSLLogFormat)
  {
    CMTrace {
      Write-HPPrivateCMTrace -Severity Error -Message $Message -Component $Component -File $file
    }
    default {
      Write-HPPrivateSimple -Severity Error -Message $Message -Component $Component -File $file
    }
  }

}

<#
.SYNOPSIS
  Writes an 'informational' log entry
  
.DESCRIPTION
  This command writes an 'informational' log entry to default output or a specified file.

.PARAMETER Message
  Specifies the message to write

.PARAMETER Component
  Specifies a 'Component' tag for the message entry. Some log readers use this parameter to group messages. If not specified, the component tag is 'General'.
  This parameter is ignored in 'Simple' mode due to backwards compatibility reasons.

.PARAMETER File
  Specifies the file to update with the new log entry. If not specified, the log entry is written to pipeline.

.EXAMPLE
  Write-LogInfo -Component "Repository" -Message "Nothing bad happened" -File myfile.log
#>
function Write-LogInfo
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Write-LogInfo")]
  param(
    [Parameter(Mandatory = $True,Position = 0)]
    [string]$Message,
    [Parameter(Mandatory = $False,Position = 1)]
    [string]$Component = "General",
    [Parameter(Mandatory = $False,Position = 2)]
    [string]$File
  )
  if ($File) {
    $file = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($file)
  }

  switch (Get-HPCMSLLogFormat)
  {
    CMTrace {
      Write-HPPrivateCMTrace -Severity Information -Message $Message -Component $Component -File $file
    }
    default {
      Write-HPPrivateSimple -Severity Information -Message $Message -Component $Component -File $file
    }
  }

}

# SIG # Begin signature block
