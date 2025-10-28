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

# For PS7, PSEdition is Core and for PS5.1, PSEdition is Desktop
if ($PSEdition -eq "Core") {
  Add-Type -Assembly $PSScriptRoot\refs\WinRT.Runtime.dll
  Add-Type -Assembly $PSScriptRoot\refs\Microsoft.Windows.SDK.NET.dll
}
else {
  [void][Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime]
  [void][Windows.UI.Notifications.ToastNotification, Windows.UI.Notifications,  ContentType = WindowsRuntime]
  [void][Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime]
}

# CMSL is normally installed in C:\Program Files\WindowsPowerShell\Modules
# but if installed via PSGallery and via PS7, it is installed in a different location
if (Test-Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll") {
  Add-Type -Path "$PSScriptRoot\..\HP.Private\HP.CMSLHelper.dll"
}
else{
  Add-Type -Path "$PSScriptRoot\..\..\HP.Private\1.8.5\HP.CMSLHelper.dll"
}

<#
    .SYNOPSIS
    Creates a logo object
    .DESCRIPTION
    This command creates a toaster logo from a file image.
    .PARAMETER Image
    Specifies the URL to the image.Http images must be 200 KB or less in size. Not all URL formats are supported in all scenarios.
    .PARAMETER Crop
    Specifies how you would like the image to be cropped.
    .EXAMPLE
    PS>  $logo = New-HPPrivateToastNotificationLogo .\logo.png
    .OUTPUTS
    This command returns the object representing the logo image.
#>
function New-HPPrivateToastNotificationLogo
{
  param(
    [Parameter(Position = 0,Mandatory = $True,ValueFromPipeline = $True)]
    [System.IO.FileInfo]$Image,

    [Parameter(Position = 1,Mandatory = $False)]
    [ValidateSet('None','Default','Circle')]
    [string]$Crop
  )

  [xml]$xml = New-Object System.Xml.XmlDocument
  $child = $xml.CreateElement("image")
  $child.SetAttribute('src',$Image.FullName)
  $child.SetAttribute('placement','appLogoOverride')
  if ($Crop) { $child.SetAttribute('hint-crop',$Crop.ToLower()) }
  $child
}

<#
    .SYNOPSIS
    Creates a toast image object
    .DESCRIPTION
    This command creates a toaster image from a file image. This image may be shown in the body of a toast message.
    .PARAMETER Image
    Specifies the URL to the image. Http images must be 200 KB or less in size.  Not all URL formats are supported in all scenarios.
    .PARAMETER Position
     Specifies that toasts can display a 'fixed' image, which is a featured ToastGenericHeroImage displayed prominently within the toast banner and while inside Action Center. Image dimensions are 364x180 pixels at 100% scaling.
     Alternately, use 'inline' to display a full-width inline-image that appears when you expand the toast.

    .EXAMPLE
    PS>  $logo = New-HPPrivateToastNotificationLogo .\hero.png
    .OUTPUTS
    This function returns the object representing the image.
    .LINK
    [ToastGenericHeroImage](https://docs.microsoft.com/en-us/windows/uwp/design/shell/tiles-and-notifications/toast-schema#toastgenericheroimage)
#>
function New-HPPrivateToastNotificationImage
{
  param(
    [Parameter(Position = 0,Mandatory = $True,ValueFromPipeline = $True)]
    [string]$Image,
    [Parameter(Position = 1,Mandatory = $False)]
    [ValidateSet('Inline','Fixed')]
    [string]$Position = 'Fixed'
  )
  [xml]$xml = New-Object System.Xml.XmlDocument
  $child = $xml.CreateElement("image")
  $child.SetAttribute('src',$Image)
  #$child.SetAttribute('placement','appLogoOverride') is this needed?

  if ($Position -eq 'Fixed') {
    $child.SetAttribute('placement','hero')
  }
  else
  {
    $child.SetAttribute('placement','inline')
  }
  $child
}

<#
    .SYNOPSIS
    Specifies the toast message alert sound
    .DESCRIPTION
    This command allows defining the sound to play on toast notification.
    .PARAMETER Sound
    Specifies the sound to play
    .PARAMETER Loop
    If specified, the sound will be looped

    .EXAMPLE
    PS>  $logo = New-HPPrivateToastSoundPreference -Sound "Alarm6" -Loop
    .OUTPUTS
    This function returns the object representing the sound preference.
    .LINK
    [ToastAudio](https://docs.microsoft.com/en-us/windows/uwp/design/shell/tiles-and-notifications/toast-schema#ToastAudio)
#>
function New-HPPrivateToastSoundPreference
{
  param(
    [Parameter(Position = 1,Mandatory = $False)]
    [ValidateSet('None','Default','IM','Mail','Reminder','SMS',
      'Alarm','Alarm2','Alarm3','Alarm4','Alarm5','Alarm6','Alarm7','Alarm8','Alarm9','Alarm10',
      'Call','Call2','Call3','Call4','Call5','Call6','Call7','Call8','Call9','Call10')]
    [string]$Sound = "Default",
    [Parameter(Position = 2,Mandatory = $False)]
    [switch]$Loop
  )
  [xml]$xml = New-Object System.Xml.XmlDocument
  $child = $xml.CreateElement("audio")
  if ($Sound -eq "None") {
    $child.SetAttribute('silent',"$true".ToLower())
    Write-Verbose "Setting audio notification to Muted"
  }
  else
  {
    $soundPath = "ms-winsoundevent:Notification.$Sound"
    if ($Sound.StartsWith('Alarm') -or $Sound.StartsWith('Call'))
    {
      $soundPath = 'winsoundevent:Notification.Looping.' + $Sound
    }
    Write-Verbose "Setting audio notification to: $soundPath"
    $child.SetAttribute('src',$soundPath)
    $child.SetAttribute('loop',([string]$Loop.IsPresent).ToLower())
    Write-Verbose "Looping audio: $($Loop.IsPresent)"
  }
  $child
}

<#
    .SYNOPSIS
    Creates a toast button
    .DESCRIPTION
    Creates a toast button for the toast
    .PARAMETER Sound
    Specifies the sound to play
    .PARAMETER Image
    Specifies the button image for a graphical button
    .PARAMETER Arguments
    Specifies app-defined string of arguments that the app will later receive if the user clicks this button.
    .OUTPUTS
    This command returns the object representing the button
    .LINK
    [ToastButton](https://docs.microsoft.com/en-us/windows/uwp/design/shell/tiles-and-notifications/toast-schema#ToastButton)
#>
function New-HPPrivateToastButton
{
    [Cmdletbinding()]
    param(
        [string]$Caption,
        [string]$Image, # leave out for normal button
        [string]$Arguments,
        [ValidateSet('Background','Protocol','System')]
        [string]$ActivationType = 'background'
    )

    Write-Verbose "Creating new toast button with caption $Caption"
    if ($Image) {
        ([xml]"<action content=`"$Caption`" imageUri=`"$Image`" arguments=`"$Arguments`" activationType=`"$ActivationType`" />").DocumentElement
    } else {
        ([xml]"<action content=`"$Caption`" arguments=`"$Arguments`" activationType=`"$ActivationType`" />").DocumentElement

    }
}

<#
  .SYNOPSIS
  Create a toast action

  .DESCRIPTION
  Create a toast action for the toast

  .PARAMETER SnoozeOrDismiss
  Automatically constructs a selection box for snooze intervals, and snooze/dismiss buttons, all automatically localized, and snoozing logic is automatically handled by the system.

  .PARAMETER Image
  For a graphical button, specify the button image

  .PARAMETER Arguments
  App-defined string of arguments that the app will later receive if the user clicks this button.

  .OUTPUTS
  This function returns the object representing the button
#>
function New-HPPrivateToastActions
{
  [CmdletBinding()]
  param(
    [Parameter(ParameterSetName = 'DismissSuppress',Position = 1,Mandatory = $True)]
    [switch]$SnoozeOrDismiss,

    [Parameter(ParameterSetName = 'DismissSuppress',Position = 2,Mandatory = $True)]
    [int]$SnoozeMinutesDefault,

    [Parameter(ParameterSetName = 'DismissSuppress',Position = 3,Mandatory = $True)]
    [int[]]$SnoozeMinutesOptions,

    [Parameter(ParameterSetName = 'CustomButtons',Position = 1,Mandatory = $True)]
    [switch]$CustomButtons,

    [Parameter(ParameterSetName = 'CustomButtons',Position = 2,Mandatory = $false)]
    [System.Xml.XmlElement[]]$Buttons,

    [Parameter(ParameterSetName = 'CustomButtons',Position = 3,Mandatory = $false)]
    [switch]$NoDismiss

  )
  [xml]$xml = New-Object System.Xml.XmlDocument
  $child = $xml.CreateElement("actions")

  switch ($PSCmdlet.ParameterSetName) {
    'DismissSuppress' {
      Write-Verbose "Creating system-handled snoozable notification"

      $i = $xml.CreateElement("input")
      [void]$child.AppendChild($i)

      $i.SetAttribute('id',"snoozeTime")
      $i.SetAttribute('type','selection')
      $i.SetAttribute('defaultInput',$SnoozeMinutesDefault)

      Write-Verbose "Notification snooze default: SnoozeMinutesDefault"
      $SnoozeMinutesOptions | ForEach-Object {
        $s = $xml.CreateElement("selection")
        $s.SetAttribute('id',"$_")
        $s.SetAttribute('content',"$_ minute")
        [void]$i.AppendChild($s)
      }

      $action = $xml.CreateElement("action")
      $action.SetAttribute('activationType','system')
      $action.SetAttribute('arguments','snooze')
      $action.SetAttribute('hint-inputId','snoozeTime')
      $action.SetAttribute('content','Snooze')
      [void]$child.AppendChild($action)

      Write-Verbose "Creating custom buttons toast"
      if ($Buttons) {
        $Buttons | ForEach-Object {
          $node = $xml.ImportNode($_,$true)
          [void]$child.AppendChild($node)
        }
      }

      $action = $xml.CreateElement("action")
      $action.SetAttribute('activationType','system')
      $action.SetAttribute('arguments','dismiss')
      $action.SetAttribute('content','Dismiss')
      [void]$child.AppendChild($action)
    }

    'CustomButtons' { # customized buttons
      Write-Verbose "Creating custom buttons toast"

      if($Buttons) {
        $Buttons | ForEach-Object {
          $node = $xml.ImportNode($_,$true)
          [void]$child.AppendChild($node)
        }
      }

      if (-not $NoDismiss.IsPresent) {
        $action = $xml.CreateElement("action")
        $action.SetAttribute('activationType','system')
        $action.SetAttribute('arguments','dismiss')
        $action.SetAttribute('content','Dismiss')
        [void]$child.AppendChild($action)
      }
    }

    default {

    }
  }

  $child
}

<#
    .SYNOPSIS
    Shows a toast message
    .DESCRIPTION
    This command shows a toast message, and optionally registers a response handler.
    .PARAMETER Message
    Specifies the message to show
    .PARAMETER Title
    Specifies title of the message to show
    .PARAMETER Logo
    Specifies a logo object created with New-HPPrivateToastNotificationLogo
    .PARAMETER Image
    Specifies a logo object created with New-HPPrivateToastNotificationImage
    .PARAMETER Expiration
    Specifies a timeout in minutes for the toast to remove itself
    .PARAMETER Tag
    Specifies a tag value for the toast. Please note that if a toast with the same tag already exists, it will be replaced by this one.
    .PARAMETER Group
    Specifies a group value for the toast
    .PARAMETER Attribution
    Specifies toast owner
    .PARAMETER Sound
    Specifies a sound notification preference created with New-HPPrivateToastSoundPreference
    .PARAMETER Actions
    .PARAMETER Persist
#>
function New-HPPrivateToastNotification
{
  [CmdletBinding()]
  param(
    [Parameter(ParameterSetName = 'TextOnly',Position = 0,Mandatory = $False,ValueFromPipeline = $True)]
    [string]$Message,

    [Parameter(Position = 1,Mandatory = $False)]
    [string]$Title,

    [Parameter(Position = 3,Mandatory = $False)]
    [System.Xml.XmlElement]$Logo,

    [Parameter(Position = 4,Mandatory = $False)]
    [int]$Expiration,

    [Parameter(Position = 5,Mandatory = $False)]
    [string]$Tag,

    [Parameter(Position = 6,Mandatory = $False)]
    [string]$Group = "hp-cmsl",

    [Parameter(Position = 8,Mandatory = $False)]
    [System.Xml.XmlElement]$Sound,

    # Apparently can't do URLs with non-uwp
    [Parameter(Position = 11,Mandatory = $False)]
    [System.Xml.XmlElement]$Image,

    [Parameter(Position = 13,Mandatory = $False)]
    [System.Xml.XmlElement]$Actions,

    [Parameter(Position = 14,Mandatory = $False)]
    [switch]$Persist,

    [Parameter(Position = 15 , Mandatory = $False)]
    [string]$Signature,

    [Parameter(Position = 16,Mandatory = $False)]
    [System.IO.FileInfo]$Xml
  )
  # if $Xml is given, load the xml instead of manually creating it
  if ($Xml) {
    Write-Verbose "Loading XML from $Xml"
    try {
      [xml]$xml = Get-Content $Xml
    } catch {
      Write-Error "Failed to load schema XML from $Xml"
      return
    }
  } else {

    # In order for signature text to be smaller, we have to add placement="attribution" to the text node. 
    # When using placement="attribution", Signature text will always be displayed at the bottom of the toast notification, 
    # along with the app's identity or the notification's timestamp if we were to customize the notification to provide these as well. 
    # On older versions of Windows that don't support attribution text, the text will simply be displayed as another text element 
    # (assuming we don't already have the maximum of three text elements, 
    # but we currently only have Invoke-HPNotification showing up to 3 text elements with the 3rd for $Signature being smallest)
    [xml]$xml = '<toast><visual><binding template="ToastGeneric"><text></text><text></text><text placement="attribution"></text></binding></visual></toast>'

    $binding = $xml.GetElementsByTagName("toast")
    if ($Sound) {
      $node = $xml.ImportNode($Sound,$true)
      [void]$binding.AppendChild($node)
    }

    if ($Persist.IsPresent)
    {
      $binding.SetAttribute('scenario','reminder')
    }

    if ($Actions) {
      $node = $xml.ImportNode($Actions,$true)
      [void]$binding.AppendChild($node)
    }

    $binding = $xml.GetElementsByTagName("binding")
    if ($Logo) {
      $node = $xml.ImportNode($Logo,$true)
      [void]$binding.AppendChild($node)
    }

    if ($Image) {
      $node = $xml.ImportNode($Image,$true)
      [void]$binding.AppendChild($node)
    }

    $binding = $xml.GetElementsByTagName("text")
    if ($Title) {
      [void]$binding[0].AppendChild($xml.CreateTextNode($Title.trim()))
    }

    [void]$binding[1].AppendChild($xml.CreateTextNode($Message.trim()))

    if ($Signature){
      [void]$binding[2].AppendChild($xml.CreateTextNode($Signature.trim()))
    }
  }

  Write-Verbose "Submitting toast with XML: $($xml.OuterXml)"
  $toast = [Windows.Data.Xml.Dom.XmlDocument]::new()
  $toast.LoadXml($xml.OuterXml)

  $toast = [Windows.UI.Notifications.ToastNotification]::new($toast)

  # if you specify a non-unique tag, it will replace the previous toast with the same non-unique tag
  if($Tag) {
    $toast.Tag = $Tag
  }

  $toast.Group = $Group

  if ($Expiration) {
    $toast.ExpirationTime = [DateTimeOffset]::Now.AddMinutes($Expiration)
  }

  return $toast
}

function Show-ToastNotification {
  [CmdletBinding()]
  param(
    [Parameter(Position = 0,Mandatory = $False,ValueFromPipeline = $true)]
    $Toast,

    [Parameter(Position = 1,Mandatory = $False)]
    [string]$Attribution = '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'
  )

  $notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($Attribution)
  $notifier.Show($toast)
}

function Register-HPPrivateScriptProtocol {
  [CmdletBinding()]
  param(
    [string]$ScriptPath,
    [string]$Name
  )

  try {
    New-Item "HKCU:\Software\Classes\$($Name)\shell\open\command" -Force -ErrorAction SilentlyContinue | Out-Null
    New-ItemProperty -LiteralPath "HKCU:\Software\Classes\$($Name)" -Name 'URL Protocol' -Value '' -PropertyType String -Force -ErrorAction SilentlyContinue | Out-Null
    New-ItemProperty -LiteralPath "HKCU:\Software\Classes\$($Name)" -Name '(default)' -Value "url:$($Name)" -PropertyType String -Force -ErrorAction SilentlyContinue | Out-Null
    New-ItemProperty -LiteralPath "HKCU:\Software\Classes\$($Name)" -Name 'EditFlags' -Value 2162688 -PropertyType Dword -Force -ErrorAction SilentlyContinue | Out-Null
    New-ItemProperty -LiteralPath "HKCU:\Software\Classes\$($Name)\shell\open\command" -Name '(default)' -Value $ScriptPath -PropertyType String -Force -ErrorAction SilentlyContinue | Out-Null
  }
  catch {
    Write-Host $_.Exception.Message
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
function Invoke-HPPrivateRebootNotificationAsUser {
  [CmdletBinding()]
  param(
    [Parameter(Position = 0,Mandatory = $false)]
    [string]$Title = "A System Reboot is Required",

    [Parameter(Position = 1,Mandatory = $false)]
    [string]$Message = "Please reboot now to keep your device compliant with the security policies.",

    [Parameter(Position = 2,Mandatory = $false)]
    [System.IO.FileInfo]$LogoImage,

    [Parameter(Position = 4,Mandatory = $false)]
    [int]$Expiration = 0,

    [Parameter(Position = 4,Mandatory = $False)]
    [string]$Attribution
  )

  # Use System Root instead of hardcoded path to C:\Windows
  Register-HPPrivateScriptProtocol -ScriptPath "$env:SystemRoot\System32\shutdown.exe -r -t 0 -f" -Name "rebootnow"

  $rebootButton = New-HPPrivateToastButton -Caption "Reboot now" -Image $null -Arguments "rebootnow:" -ActivationType "Protocol"

  $params = @{
    Message = $Message
    Title = $Title
    Expiration = $Expiration
    Actions = New-HPPrivateToastActions -CustomButtons -Buttons $rebootButton
    Sound = New-HPPrivateToastSoundPreference -Sound IM
  }

  if ($LogoImage) {
    $params.Logo = New-HPPrivateToastNotificationLogo -Image $LogoImage -Crop Circle
  }

  $toast = New-HPPrivateToastNotification @params -Persist

  if ($toast) {
    if ([string]::IsNullOrEmpty($Attribution)) {
      Show-ToastNotification -Toast $toast
    }
    else {
      Show-ToastNotification -Toast $toast -Attribution $Attribution
    }
  }

  return
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
function Invoke-HPPrivateNotificationAsUser {
  [CmdletBinding()]
  param(
    [Parameter(Position = 0,Mandatory = $false)]
    [string]$Title,

    [Parameter(Position = 1,Mandatory = $false)]
    [string]$Message,

    [Parameter(Position = 2,Mandatory = $false)]
    [System.IO.FileInfo]$LogoImage,

    [Parameter(Position = 4,Mandatory = $false)]
    [int]$Expiration = 0,

    [Parameter(Position = 4,Mandatory = $False)]
    [string]$Attribution,

    [Parameter(Position = 5,Mandatory = $false)]
    [string]$NoDismiss = "false", # environment variables can only be strings, so Dismiss parameter is a string

    [Parameter(Position = 6,Mandatory = $false)]
    [string]$Signature,

    [Parameter(Position = 7,Mandatory = $false)]
    [System.IO.FileInfo]$Xml,

    [Parameter(Position = 8,Mandatory = $false)]
    [System.IO.FileInfo]$Actions
  )

  if ($Xml){
    if($Actions){
      # parse the file of Actions to get the actions to register 
      try {
       $listOfActions = Get-Content $Actions | ConvertFrom-Json
      }
      catch {
       Write-Error "Failed to parse the file of actions: $($_.Exception.Message). Will not proceed with invoking notification."
       return
      }

      # register every action in list of actions 
      foreach ($action in $listOfActions) {
       Register-HPPrivateScriptProtocol -ScriptPath $action.cmd -Name $action.id
      }

      Write-Verbose "Done registering actions"
    }
    
    $toast = New-HPPrivateToastNotification -Expiration $Expiration -Xml $Xml -Persist

   if ($toast) {
     if ([string]::IsNullOrEmpty($Attribution)) {
       Show-ToastNotification -Toast $toast
     }
     else {
       Show-ToastNotification -Toast $toast -Attribution $Attribution
     }
   }
  }
  else{
    $params = @{
      Message = $Message
      Title = $Title
      Expiration = $Expiration
      Signature = $Signature
      Sound = New-HPPrivateToastSoundPreference -Sound IM
    }
  
    # environment variables can only be strings, so Dismiss parameter is a string
    if ($NoDismiss -eq "false") {
      $params.Actions = New-HPPrivateToastActions -CustomButtons
    }
    else {
      $params.Actions = New-HPPrivateToastActions -CustomButtons -NoDismiss
    }
  
    if ($LogoImage) {
      $params.Logo = New-HPPrivateToastNotificationLogo -Image $LogoImage -Crop Circle
    }
  
    $toast = New-HPPrivateToastNotification @params -Persist
  
    if ([string]::IsNullOrEmpty($Attribution)) {
      Show-ToastNotification -Toast $toast
    }
    else {
      Show-ToastNotification -Toast $toast -Attribution $Attribution
    }
  }

  return 
}

<#
.SYNOPSIS
  Register-HPNotificationApplication

.DESCRIPTION
  This function registers toast notification applications

.PARAMETER Id
  Specifies the application id

.PARAMETER DisplayName
  Specifies the application name to display on the toast notification

.EXAMPLE
  Register-HPNotificationApplication -Id 'hp.cmsl.12345' -DisplayName 'HP CMSL'
#>
function Register-HPNotificationApplication {
  [CmdletBinding()]
  [Alias('Register-NotificationApplication')]
  param(
      [Parameter(Mandatory=$true)]
      [string]$Id,

      [Parameter(Mandatory=$true)]
      [string]$DisplayName,

      [Parameter(Mandatory=$false)]
      [System.IO.FileInfo]$IconPath
  )
  if (-not (Test-IsHPElevatedAdmin)) {
    throw [System.Security.AccessControl.PrivilegeNotHeldException]"elevated administrator"
  }

  Write-Verbose "Registering notification application with id: $Id and display name: $DisplayName and icon path: $IconPath"

  $drive = Get-PSDrive -Name HKCR -ErrorAction SilentlyContinue
  if (-not $drive) {
    $drive = New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT -Scope Script
  }
  $appRegPath = Join-Path -Path "$($drive):" -ChildPath 'AppUserModelId'
  $regPath = Join-Path -Path $appRegPath -ChildPath $Id
  if (-not (Test-Path $regPath))
  {
    New-Item -Path $appRegPath -Name $Id -Force | Out-Null
  }
  $currentDisplayName = Get-ItemProperty -Path $regPath -Name DisplayName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty DisplayName -ErrorAction SilentlyContinue
  if ($currentDisplayName -ne $DisplayName) {
    New-ItemProperty -Path $regPath -Name DisplayName -Value $DisplayName -PropertyType String -Force | Out-Null
  }

  New-ItemProperty -Path $regPath -Name IconUri -Value $IconPath -PropertyType ExpandString -Force | Out-Null	
  New-ItemProperty -Path $regPath -Name IconBackgroundColor -Value 0 -PropertyType ExpandString -Force | Out-Null
  Remove-PSDrive -Name HKCR -Force

  Write-Verbose "Registered toast notification application: $DisplayName"
}

<#
.SYNOPSIS
  UnRegister-HPNotificationApplication

.DESCRIPTION
  This function unregisters toast notification applications. Do not unregister the application if you want to snooze the notification.

.PARAMETER Id
  Specifies the application ID to unregister 

.EXAMPLE
  UnRegister-HPNotificationApplication -Id 'hp.cmsl.12345'
#>
function Unregister-HPNotificationApplication {
  [CmdletBinding()]
  [Alias('Unregister-NotificationApplication')]
  param(
      [Parameter(Mandatory=$true)]
      $Id
  )
  if (-not (Test-IsHPElevatedAdmin)) {
    throw [System.Security.AccessControl.PrivilegeNotHeldException]"elevated administrator"
  }

  $drive = Get-PSDrive -Name HKCR -ErrorAction SilentlyContinue
  if (-not $drive) {
    $drive = New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT -Scope Script
  }
  $appRegPath = Join-Path -Path "$($drive):" -ChildPath 'AppUserModelId'
  $regPath = Join-Path -Path $appRegPath -ChildPath $Id
  if (Test-Path $regPath) {
    Remove-Item -Path $regPath
  }
  else {
    Write-Verbose "Application not found at $regPath"
  }
  Remove-PSDrive -Name HKCR -Force

  Write-Verbose "Unregistered toast notification application: $Id"
}

<#
.SYNOPSIS
  Invoke-HPRebootNotification

.DESCRIPTION
  This command shows a toast message asking the user to reboot the system. 

.PARAMETER Message
  Specifies the message to show

.PARAMETER Title
  Specifies the title of the message to show

.PARAMETER LogoImage
  Specifies the image file path to be displayed

.PARAMETER Expiration
  Specifies the timeout in minutes for the toast to remove itself. If not specified, the toast remains until dismissed.

.PARAMETER TitleBarHeader
  Specifies the text of the toast notification in the title bar. If not specified, the text will default to "HP System Update". 

.PARAMETER TitleBarIcon
  Specifies the icon of the toast notification in the title bar. If not specified, the icon will default to the HP logo. Please note that the color of the icon might be inverted depending on the background color of the title bar.


.EXAMPLE
  Invoke-HPRebootNotification -Title "My title" -Message "My message"
#>
function Invoke-HPRebootNotification {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Invoke-HPRebootNotification")]
  [Alias("Invoke-RebootNotification")] # we can deprecate Invoke-RebootNotification later 
  param(
    [Parameter(Position = 0,Mandatory = $False)]
    [string]$Title = "A System Reboot Is Required",

    [Parameter(Position = 1,Mandatory = $False)]
    [string]$Message = "Please reboot now to keep your device compliant with organizational policies.",

    [Parameter(Position = 2,Mandatory = $false)]
    [System.IO.FileInfo]$LogoImage,

    [Parameter(Position = 3,Mandatory = $false)]
    [int]$Expiration = 0,

    [Parameter(Position = 4,Mandatory = $false)]
    [string]$TitleBarHeader = "HP System Update", # we don't want to display "Windows PowerShell" in the title bar

    [Parameter(Position = 5,Mandatory = $false)]
    [System.IO.FileInfo]$TitleBarIcon = (Join-Path -Path $PSScriptRoot -ChildPath 'assets\hp_black_logo.png') # default to HP logo 
  )

  # Create a unique Id to distinguish this notification application from others using "hp.cmsl" and the current time
  $Id = "hp.cmsl.$([DateTime]::Now.Ticks)"

  # Convert the relative path for TitleBarIcon into absolute path
  $TitleBarIcon = (Get-Item -Path $TitleBarIcon).FullName

  # An app registration is needed to set the issuer name and icon in the title bar 
  Register-HPNotificationApplication -Id $Id -DisplayName $TitleBarHeader -IconPath $TitleBarIcon

  # When using system privileges, the block executes in a different context, 
  # so the relative path for LogoImage must be converted to an absolute path.
  # On another note, System.IO.FileInfo.FullName property isn't updated when you change your working directory in PowerShell, 
  # so in the case for user privileges, 
  # using Get-Item here to avoid getting wrong absolute path later 
  # when using System.IO.FileInfo.FullName property in New-HPPrivateToastNotificationLogo. 
  if ($LogoImage) {
    $LogoImage = (Get-Item -Path $LogoImage).FullName
  }

  $privs = whoami /priv /fo csv | ConvertFrom-Csv | Where-Object { $_. 'Privilege Name' -eq 'SeDelegateSessionUserImpersonatePrivilege' }
  if ($privs.State -eq "Disabled") {
    Write-Verbose "Running with user privileges"
    Invoke-HPPrivateRebootNotificationAsUser -Title $Title -Message $Message -LogoImage $LogoImage -Expiration $Expiration -Attribution $Id
  }
  else {
    Write-Verbose "Running with system privileges"
    
    try {
      $psPath = (Get-Process -Id $pid).Path
      # Passing the parameters as environment variable because the following block executes in a different context
      [System.Environment]::SetEnvironmentVariable('HPRebootTitle',$Title,[System.EnvironmentVariableTarget]::Machine)
      [System.Environment]::SetEnvironmentVariable('HPRebootMessage',$Message,[System.EnvironmentVariableTarget]::Machine)
      [System.Environment]::SetEnvironmentVariable('HPRebootAttribution',$Id,[System.EnvironmentVariableTarget]::Machine)

      if ($LogoImage) {
        [System.Environment]::SetEnvironmentVariable('HPRebootLogoImage',$LogoImage,[System.EnvironmentVariableTarget]::Machine)
      }
      if ($Expiration) {
        [System.Environment]::SetEnvironmentVariable('HPRebootExpiration',$Expiration,[System.EnvironmentVariableTarget]::Machine)
      }
   
      [scriptblock]$scriptBlock = {
        $path = $pwd.Path
        Import-Module -Force $path\HP.Notifications.psd1
        $params = @{
          Title = $env:HPRebootTitle
          Message = $env:HPRebootMessage
          Attribution = $env:HPRebootAttribution
        }

        if ($env:HPRebootLogoImage) {
          $params.LogoImage = $env:HPRebootLogoImage
        }
       
        if ($env:HPRebootExpiration) {
          $params.Expiration = $env:HPRebootExpiration
        }
      
        Invoke-HPPrivateRebootNotificationAsUser @params
      }

      $encodedCommand = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($scriptBlock))
      $psCommand = "-ExecutionPolicy Bypass -Window Normal -EncodedCommand $($encodedCommand)"
      [ProcessExtensions]::StartProcessAsCurrentUser($psPath,"`"$psPath`" $psCommand",$PSScriptRoot)
      [System.Environment]::SetEnvironmentVariable('HPRebootTitle',$null,[System.EnvironmentVariableTarget]::Machine)
      [System.Environment]::SetEnvironmentVariable('HPRebootMessage',$null,[System.EnvironmentVariableTarget]::Machine)
      [System.Environment]::SetEnvironmentVariable('HPRebootAttribution',$null,[System.EnvironmentVariableTarget]::Machine)

      if ($LogoImage) {
        [System.Environment]::SetEnvironmentVariable('HPRebootLogoImage',$null,[System.EnvironmentVariableTarget]::Machine)
      }
      if ($Expiration) {
        [System.Environment]::SetEnvironmentVariable('HPRebootExpiration',$null,[System.EnvironmentVariableTarget]::Machine)
      }
   
    }
    catch {
      Write-Error -Message "Could not execute as currently logged on user: $($_.Exception.Message)" -Exception $_.Exception
    }
  }

  # add a delay before unregistering the app because if you unregister the app right away, toast notification won't pop up 
  Start-Sleep -Seconds 5
  UnRegister-HPNotificationApplication -Id $Id

  return
}


<#
.SYNOPSIS
  Triggers a toast notification from XML 

.DESCRIPTION
  This command triggers a toast notification from XML. Similar to the Invoke-HPNotification command, this command triggers toast notifications, but this command is more flexible and allows for more customization.

.PARAMETER Xml
  Specifies the schema XML content of the toast notification. Please specify either Xml or XmlPath, but not both.

.PARAMETER XmlPath
  Specifies the file path to the schema XML content of the toast notification. Please specify either Xml or XmlPath, but not both.

.PARAMETER ActionsJson
  Specifies the actions that should be map the button id(s) (if any specified in XML) to the command(s) to call upon clicking the corresponding button. You can specify either ActionsJson or ActionsJsonPath, but not both.

  Please note that button actions are registered in HKEY_CURRENT_USER in the registry. Button actions will persist until the user logs off. 

  Example to reboot the system upon clicking the button:
  [
   {
      "id":"rebootnow",
      "cmd":"C:\\Windows\\System32\\shutdown.exe -r -t 0 -f"
   }
  ]

.PARAMETER ActionsJsonPath
  Specifies the file path to the actions that should be map the button id(s) (if any specified in XML) to the command(s) to call upon clicking the corresponding button. You can specify either ActionsJson or ActionsJsonPath, but not both.
  
  Please note that button actions are registered in HKEY_CURRENT_USER in the registry. Button actions will persist until the user logs off. 

.PARAMETER Expiration
  Specifies the life of the toast notification in minutes whether toast notification is on the screen or in the Action Center. If not specified, the invoked toast notification remains on screen until dismissed.

.PARAMETER TitleBarHeader
  Specifies the text of the toast notification in the title bar. If not specified, the text will default to "HP System Notification". 

.PARAMETER TitleBarIcon
  Specifies the icon of the toast notification in the title bar. If not specified, the icon will default to the HP logo. Please note that the color of the icon might be inverted depending on the background color of the title bar.


.EXAMPLE
  Invoke-HPNotificationFromXML -XmlPath 'C:\path\to\schema.xml' -ActionsJsonPath 'C:\path\to\actions.json'

.EXAMPLE
  Invoke-HPNotificationFromXML -XmlPath 'C:\path\to\schema.xml' -ActionsJson '[
   {
      "id":"rebootnow",
      "cmd":"C:\\Windows\\System32\\shutdown.exe -r -t 0 -f"
   }
  ]'

.EXAMPLE
  Invoke-HPNotificationFromXML -XmlPath 'C:\path\to\schema.xml' 

#>
function Invoke-HPNotificationFromXML {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Invoke-HPNotificationFromXML")]
  param(
    [Parameter(ParameterSetName = 'XmlAJ',Mandatory = $false)]
    [Parameter(ParameterSetName = 'XmlAJP',Mandatory = $false)]
    [Parameter(ParameterSetName = 'XmlPathAJ',Mandatory = $false)]
    [Parameter(ParameterSetName = 'XmlPathAJP',Mandatory = $false)]
    [int]$Expiration = 0,

    [Parameter(ParameterSetName = 'XmlAJ',Mandatory = $false)]
    [Parameter(ParameterSetName = 'XmlAJP',Mandatory = $false)]
    [Parameter(ParameterSetName = 'XmlPathAJ',Mandatory = $false)]
    [Parameter(ParameterSetName = 'XmlPathAJP',Mandatory = $false)]
    [string]$TitleBarHeader = "HP System Notification", # we don't want to display "Windows PowerShell" in the title bar

    [Parameter(ParameterSetName = 'XmlAJ',Mandatory = $false)]
    [Parameter(ParameterSetName = 'XmlAJP',Mandatory = $false)]
    [Parameter(ParameterSetName = 'XmlPathAJ',Mandatory = $false)]
    [Parameter(ParameterSetName = 'XmlPathAJP',Mandatory = $false)]
    [System.IO.FileInfo]$TitleBarIcon = (Join-Path -Path $PSScriptRoot -ChildPath 'assets\hp_black_logo.png'), # default to HP logo
   
    [Parameter(ParameterSetName = 'XmlAJ',Mandatory = $true)]
    [Parameter(ParameterSetName = 'XmlAJP', Mandatory = $true)]
    [string]$Xml, # both $Xml and $XmlPath cannot be specified

    [Parameter(ParameterSetName = 'XmlPathAJ', Mandatory = $true)]
    [Parameter(ParameterSetName = 'XmlPathAJP', Mandatory = $true)]
    [System.IO.FileInfo]$XmlPath, # both $Xml and $XmlPath cannot be specified

    [Parameter(ParameterSetName = 'XmlAJ',Mandatory = $false)]
    [Parameter(ParameterSetName = 'XmlPathAJ',Mandatory = $false)]
    [string]$ActionsJson, # list of actions that should align with the buttons in the schema Xml file. If no buttons, this field is not needed

    # both $ActionsJson and $ActionsJsonPath cannot be specified, so making one mandatory to resolve ambiguity
    [Parameter(ParameterSetName = 'XmlAJP',Mandatory = $true)] 
    [Parameter(ParameterSetName = 'XmlPathAJP',Mandatory = $true)]
    [System.IO.FileInfo]$ActionsJsonPath 
    )

  # if Xml, save the contents to a file and set file path to $XmlPath
  if ($Xml) {
    # create a unique file name for the schema XML file to avoid conflicts
    $XmlPath = Join-Path -Path $PSScriptRoot -ChildPath "HPNotificationSchema$([DateTime]::Now.Ticks).xml"
    $Xml | Out-File -FilePath $XmlPath -Force
    Write-Verbose "Created schema XML file at $XmlPath"
  }

  # if ActionsJson, save the contents to a file and set file path to $ActionsJsonPath
  if ($ActionsJson) {
    # create a unique file name for the actions JSON file to avoid conflicts
    $ActionsJsonPath = Join-Path -Path $PSScriptRoot -ChildPath "HPNotificationActions$([DateTime]::Now.Ticks).json"
    $ActionsJson | Out-File -FilePath $ActionsJsonPath -Force
    Write-Verbose "Created actions JSON file at $ActionsJsonPath"
  }

  # Create a unique Id to distinguish this notification application from others using "hp.cmsl" and the current time
  $Id = "hp.cmsl.$([DateTime]::Now.Ticks)"

  # Convert the relative path for TitleBarIcon into absolute path
  $TitleBarIcon = (Get-Item -Path $TitleBarIcon).FullName

  # An app registration is needed to set the issuer name and icon in the title bar 
  Register-HPNotificationApplication -Id $Id -DisplayName $TitleBarHeader -IconPath $TitleBarIcon

  $privs = whoami /priv /fo csv | ConvertFrom-Csv | Where-Object { $_. 'Privilege Name' -eq 'SeDelegateSessionUserImpersonatePrivilege' }
  if ($privs.State -eq "Disabled") {
    Write-Verbose "Running with user privileges"
    Invoke-HPPrivateNotificationAsUser -Xml $XmlPath -Actions $ActionsJsonPath -Expiration $Expiration -Attribution $Id 
  }
  else {
    Write-Verbose "Running with system privileges"

    # XmlPath and ActionsJsonPath do not work with system privileges if a relative file path is passed in 
    # because the following block executes in a different context
    # If a relative path is passed in, convert the relative path into absolute path
    if ($XmlPath) {
      $XmlPath = (Get-Item -Path $XmlPath).FullName
    }

    if ($ActionsJsonPath) {
      $ActionsJsonPath = (Get-Item -Path $ActionsJsonPath).FullName
    }

    try {
      $psPath = (Get-Process -Id $pid).Path

      # Passing the parameters as environment variable because the following block executes in a different context
      [System.Environment]::SetEnvironmentVariable('HPNotificationFromXmlAttribution',$Id,[System.EnvironmentVariableTarget]::Machine)
      [System.Environment]::SetEnvironmentVariable('HPNotificationFromXmlXml',$XmlPath,[System.EnvironmentVariableTarget]::Machine)
     
      if($ActionsJsonPath){
        [System.Environment]::SetEnvironmentVariable('HPNotificationFromXmlActions',$ActionsJsonPath,[System.EnvironmentVariableTarget]::Machine)
      }

      if ($Expiration) {
        [System.Environment]::SetEnvironmentVariable('HPNotificationFromXmlExpiration',$Expiration,[System.EnvironmentVariableTarget]::Machine)
      }

      [scriptblock]$scriptBlock = {
        $path = $pwd.Path
        Import-Module -Force $path\HP.Notifications.psd1
        $params = @{
          Xml = $env:HPNotificationFromXmlXml
          Actions = $env:HPNotificationFromXmlActions
          Attribution = $env:HPNotificationFromXmlAttribution
        }

        if ($env:HPNotificationFromXmlExpiration) {
          $params.Expiration = $env:HPNotificationFromXmlExpiration
        }

        Invoke-HPPrivateNotificationAsUser @params
      }

      $encodedCommand = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($scriptBlock))
      $psCommand = "-ExecutionPolicy Bypass -Window Normal -EncodedCommand $($encodedCommand)"
      [ProcessExtensions]::StartProcessAsCurrentUser($psPath,"`"$psPath`" $psCommand",$PSScriptRoot)

      [System.Environment]::SetEnvironmentVariable('HPNotificationFromXmlAttribution',$null,[System.EnvironmentVariableTarget]::Machine)
      [System.Environment]::SetEnvironmentVariable('HPNotificationFromXmlXml',$null,[System.EnvironmentVariableTarget]::Machine)

      if($ActionsJsonPath){
        [System.Environment]::SetEnvironmentVariable('HPNotificationFromXmlActions',$null,[System.EnvironmentVariableTarget]::Machine)
      }
      if ($Expiration) {
        [System.Environment]::SetEnvironmentVariable('HPNotificationFromXmlExpiration',$null,[System.EnvironmentVariableTarget]::Machine)
      }
    }
    catch {
      Write-Error -Message "Could not execute as currently logged on user: $($_.Exception.Message)" -Exception $_.Exception
    }
  }

  # if temporary XML file was created, remove it
  if($Xml) {
    Remove-Item -Path $XmlPath -Force
    Write-Verbose "Removed temporary schema XML file at $XmlPath"
  }

  # if temporary Actions JSON file was created, remove it
  if($ActionsJson) {
    Remove-Item -Path $ActionsJsonPath -Force
    Write-Verbose "Removed temporary actions JSON file at $ActionsJsonPath"
  }

  # do not unregister the app because we want to allow the user to snooze the notification 
  return
}

<#
.SYNOPSIS
  Triggers a toast notification

.DESCRIPTION
  This command triggers a toast notification.

.PARAMETER Message
  Specifies the message to display. This parameter is mandatory. Please note, an empty string is not allowed.

.PARAMETER Title
  Specifies the title to display. This parameter is mandatory. Please note, an empty string is not allowed. 

.PARAMETER LogoImage
  Specifies the image file path to be displayed

.PARAMETER Expiration
  Specifies the life of the toast notification in minutes whether toast notification is on the screen or in the Action Center. If not specified, the invoked toast notification remains on screen until dismissed.

.PARAMETER TitleBarHeader
  Specifies the text of the toast notification in the title bar. If not specified, the text will default to "HP System Notification". 

.PARAMETER TitleBarIcon
  Specifies the icon of the toast notification in the title bar. If not specified, the icon will default to the HP logo. Please note that the color of the icon might be inverted depending on the background color of the title bar.

.PARAMETER Signature
  Specifies the text to display below the message at the bottom of the toast notification in a smaller font. Please note that on older versions of Windows that don't support attribution text, the signature will just be displayed as another text element in the same font as the message. 

.PARAMETER Dismiss
  If set to true or not specified, the toast notification will show a Dismiss button to dismiss the notification. If set to false, the toast notification will not show a Dismiss button and will disappear from the screen and go to the Action Center after 5-7 seconds of invocation. Please note that dismissing the notification overrides any specified Expiration time as the notification will not go to the Action Center once dismissed.


.EXAMPLE
  Invoke-HPNotification -Title "My title" -Message "My message" -Dismiss $false 

.EXAMPLE
  Invoke-HPNotificataion -Title "My title" -Message "My message" -Signature "Foo Bar" -Expiration 5
#>
function Invoke-HPNotification {
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Invoke-HPNotification")]
  param(
    [Parameter(Position = 0,Mandatory = $true)]
    [string]$Title,

    [Parameter(Position = 1,Mandatory = $true)]
    [string]$Message,

    [Parameter(Position = 2,Mandatory = $false)]
    [System.IO.FileInfo]$LogoImage,

    [Parameter(Position = 3,Mandatory = $false)]
    [int]$Expiration = 0,

    [Parameter(Position = 4,Mandatory = $false)]
    [string]$TitleBarHeader = "HP System Notification", # we don't want to display "Windows PowerShell" in the title bar

    [Parameter(Position = 5,Mandatory = $false)]
    [System.IO.FileInfo]$TitleBarIcon = (Join-Path -Path $PSScriptRoot -ChildPath 'assets\hp_black_logo.png'), # default to HP logo

    [Parameter(Position = 6,Mandatory = $false)]
    [string]$Signature, # text in smaller font under Title and Message at the bottom of the toast notification 
    
    [Parameter(Position = 7,Mandatory = $false)]
    [bool]$Dismiss = $true # if not specified, default to showing the Dismiss button
  )

  # Create a unique Id to distinguish this notification application from others using "hp.cmsl" and the current time
  $Id = "hp.cmsl.$([DateTime]::Now.Ticks)"

  # Convert the relative path for TitleBarIcon into absolute path
  $TitleBarIcon = (Get-Item -Path $TitleBarIcon).FullName
  
  # An app registration is needed to set the issuer name and icon in the title bar 
  Register-HPNotificationApplication -Id $Id -DisplayName $TitleBarHeader -IconPath $TitleBarIcon

  # When using system privileges, the block executes in a different context, 
  # so the relative path for LogoImage must be converted to an absolute path.
  # On another note, System.IO.FileInfo.FullName property isn't updated when you change your working directory in PowerShell, 
  # so in the case for user privileges, 
  # using Get-Item here to avoid getting wrong absolute path later 
  # when using System.IO.FileInfo.FullName property in New-HPPrivateToastNotificationLogo. 
  if ($LogoImage) {
    $LogoImage = (Get-Item -Path $LogoImage).FullName
  }

  $privs = whoami /priv /fo csv | ConvertFrom-Csv | Where-Object { $_. 'Privilege Name' -eq 'SeDelegateSessionUserImpersonatePrivilege' }
  if ($privs.State -eq "Disabled") {
    Write-Verbose "Running with user privileges"

    # Invoke-HPPrivateNotificationAsUser is modeled after Invoke-HPPrivateRebootNotificationAsUser so using -NoDismiss instead of -Dismiss for consistency 
    if($Dismiss) {
      Invoke-HPPrivateNotificationAsUser -Title $Title -Message $Message -LogoImage $LogoImage -Expiration $Expiration -Attribution $Id -Signature $Signature -NoDismiss "false"
    }
    else {
      Invoke-HPPrivateNotificationAsUser -Title $Title -Message $Message -LogoImage $LogoImage -Expiration $Expiration -Attribution $Id -Signature $Signature -NoDismiss "true" 
    }
  }
  else {
    Write-Verbose "Running with system privileges"

    try {
      $psPath = (Get-Process -Id $pid).Path

      # Passing the parameters as environment variable because the following block executes in a different context
      [System.Environment]::SetEnvironmentVariable('HPNotificationTitle',$Title,[System.EnvironmentVariableTarget]::Machine)
      [System.Environment]::SetEnvironmentVariable('HPNotificationMessage',$Message,[System.EnvironmentVariableTarget]::Machine)
      [System.Environment]::SetEnvironmentVariable('HPNotificationSignature',$Signature,[System.EnvironmentVariableTarget]::Machine)
      [System.Environment]::SetEnvironmentVariable('HPNotificationAttribution',$Id,[System.EnvironmentVariableTarget]::Machine)

      if ($LogoImage) {
        [System.Environment]::SetEnvironmentVariable('HPNotificationLogoImage',$LogoImage,[System.EnvironmentVariableTarget]::Machine)
      }
      if ($Expiration) {
        [System.Environment]::SetEnvironmentVariable('HPNotificationExpiration',$Expiration,[System.EnvironmentVariableTarget]::Machine)
      }

      # environment variables can only be strings, so we need to convert the Dismiss boolean to a string
      if($Dismiss) {
        [System.Environment]::SetEnvironmentVariable('HPNotificationNoDismiss', "false",[System.EnvironmentVariableTarget]::Machine)
      }
      else {
        [System.Environment]::SetEnvironmentVariable('HPNotificationNoDismiss', "true",[System.EnvironmentVariableTarget]::Machine)
      }
   
      [scriptblock]$scriptBlock = {
        $path = $pwd.Path
        Import-Module -Force $path\HP.Notifications.psd1
        $params = @{
          Title = $env:HPNotificationTitle
          Message = $env:HPNotificationMessage
          Signature = $env:HPNotificationSignature
          Attribution = $env:HPNotificationAttribution
          NoDismiss = $env:HPNotificationNoDismiss
        }

        if ($env:HPNotificationLogoImage) {
          $params.LogoImage = $env:HPNotificationLogoImage
        }
       
        if ($env:HPNotificationExpiration) {
          $params.Expiration = $env:HPNotificationExpiration
        }

        Invoke-HPPrivateNotificationAsUser @params
      }

      $encodedCommand = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($scriptBlock))
      $psCommand = "-ExecutionPolicy Bypass -Window Normal -EncodedCommand $($encodedCommand)"
      [ProcessExtensions]::StartProcessAsCurrentUser($psPath,"`"$psPath`" $psCommand",$PSScriptRoot)

      [System.Environment]::SetEnvironmentVariable('HPNotificationTitle',$null,[System.EnvironmentVariableTarget]::Machine)
      [System.Environment]::SetEnvironmentVariable('HPNotificationMessage',$null,[System.EnvironmentVariableTarget]::Machine)
      [System.Environment]::SetEnvironmentVariable('HPNotificationSignature',$null,[System.EnvironmentVariableTarget]::Machine)
      [System.Environment]::SetEnvironmentVariable('HPNotificationAttribution',$null,[System.EnvironmentVariableTarget]::Machine)
      [System.Environment]::SetEnvironmentVariable('HPNotificationNoDismiss',$null,[System.EnvironmentVariableTarget]::Machine)

      if ($LogoImage) {
        [System.Environment]::SetEnvironmentVariable('HPNotificationLogoImage',$null,[System.EnvironmentVariableTarget]::Machine)
      }
      if ($Expiration) {
        [System.Environment]::SetEnvironmentVariable('HPNotificationExpiration',$null,[System.EnvironmentVariableTarget]::Machine)
      }
    }
    catch {
      Write-Error -Message "Could not execute as currently logged on user: $($_.Exception.Message)" -Exception $_.Exception
    }
  }

  # add a delay before unregistering the app because if you unregister the app right away, toast notification won't pop up 
  Start-Sleep -Seconds 5
  UnRegister-HPNotificationApplication -Id $Id

  return
}


# SIG # Begin signature block
