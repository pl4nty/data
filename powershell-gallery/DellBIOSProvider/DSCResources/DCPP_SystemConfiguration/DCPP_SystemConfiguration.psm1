# Import the helper functions

Import-Module $PSScriptRoot\..\..\Misc\helper.psm1 -Verbose:$false

function Get-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Collections.Hashtable])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$Category
	)

	#Write-Verbose "Use this cmdlet to deliver information about command processing."

	#Write-Debug "Use this cmdlet to write debug information while troubleshooting."


	<#
	$returnValue = @{
		Category = [System.String]
		MultiCoreSupport = [System.String]
		IntelSpeedStep = [System.String]
		CStates = [System.String]
		IntelTurboBoost = [System.String]
		HyperThreadControl = [System.String]
		Password = [System.String]
		SecurePassword = [System.String]
		PathToKey = [System.String]
	}

	$returnValue
	#>
	
				   # Check if module DellBIOSprovider is already loaded. If not, load it.
   try{
    $bool = Confirm-DellPSDrive -verbose
    }
    catch 
    {
        write-Verbose $_
        $msg = "Get-TargetResource: $($_.Exception.Message)"
        Write-DellEventLog -Message $msg -EventID 1 -EntryType 'Error'
        write-Verbose "Exiting Get-TargetResource"
        return
    }
    if ($bool) {                      
        Write-Verbose "Dell PS-Drive DellSmbios is found."
    }
    else{
        $Message = “Get-TargetResource: Module DellBiosProvider was imported correctly."
        Write-DellEventLog -Message $Message -EventID 2 
    }

    $Get = get-childitem -path @("DellSmbios:\" + $Category)
     # Removing Verbose and Debug from output
    $PSBoundParameters.Remove("Verbose") | out-null
    $PSBoundParameters.Remove("Debug") | out-null

  
    $out = @{}   
    $Get | foreach-Object {$out.Add($_.Attribute, $_.CurrentValue)}
    $out.add('Category', $Category )
    $out

}


function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$Category,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$WatchdogTimer,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$MEMSSensors,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$KeyboardBacklightOnAc,
		
		[ValidateSet("Enabled","Disabled","Auto")]
		[System.String]
		$IntegratedAudio,
		
		[ValidateSet("Enabled","Disabled","Low","Medium","High")]
		[System.String]
		$InternalSpeaker,
		
		[ValidateSet("Enabled","Disabled","EnabledPxe","OnWithImageServerBoot","EnabledwithRPLBoot","EnabledwithISCSIBoot")]
		[System.String]
		$EmbNic1,
		
		[ValidateSet("Off","25","50","75","100","Auto")]
		[System.String]
		$KeyboardIllumination,
		
		[ValidateSet("Ata","Disabled","Ahci","Raid")]
		[System.String]
		$EmbSataRaid,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$PowerButton,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$OnboardSoundDevice,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$IoModule,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$CanBus,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$UefiNwStack,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata0,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata1,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata2,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata3,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata4,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata5,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata6,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata7,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Minisas0,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Minisas1,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Minisas2,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Minisas3,
		
		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel1,

		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel2,

		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel3,

		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel4,

		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel5,

		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel6,

		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel7,

		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel8,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$SmartErrors,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$DisOsdBtn,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Hdd1FanEnable,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Hdd2FanEnable,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Hdd3FanEnable,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$LiquidCooler1,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$LiquidCooler2,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$UsbPowerShare,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Microphone,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$DockSupportOnBattery,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$UnobtrusiveMode,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Touchscreen,		

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$M2PcieSsd0,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$M2PcieSsd1,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$MmioAbove4Gb,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$IntegratedSas,		
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$OptionalBootSequence,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$NearFieldComputing,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$ForcePxeNextBoot,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$ForcePXEasFirstBootDevice,
				
		[ValidateSet("Auto","Disabled")]
		[System.String]
		$VmdPcieSlot,
						
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$VmdNvmePcie0,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$VmdNvmePcie1,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$VmdNvmePcie0Cpu1,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$VmdNvmePcie1Cpu1,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata8,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$EMMCDevice,
		
		[System.String]
		$Password,

		[System.String]
		$SecurePassword,

		[System.String]
		$PathToKey
	)

    if (-not(CheckModuleLoaded)) {
        Write-Verbose -Message 'Required module DellBiosProvider does not exist. Exiting.'
        return $true
    }

    $DellPSDrive = get-psdrive -name Dellsmbios
    if ( !$DellPSDrive)
    {
        $Message = "Drive DellSmbios is not found. Exiting."
        Write-Verbose $Message
        Write-DellEventLog -Message $Message -EventID 3 -EntryType "Error"
        return $true
    }
    $attributes_desired = $PSBoundParameters
    $atts = $attributes_desired

    $pathToCategory = $DellPSDrive.Name + ':\' + $atts["Category"]
    
    Dir $pathToCategory -verbose

    $atts.Remove("Verbose") | out-null
    $atts.Remove("Category") | out-null
    $atts.Remove("Debug") | out-null
    $securePwd=$atts["SecurePassword"]
    $passwordSet=$atts["Password"]
    $atts.Remove("Password") | Out-Null
    $atts.Remove("SecurePassword") | Out-Null
    $pathToKey=$atts["PathToKey"]
	if(-Not [string]::IsNullOrEmpty($pathToKey))
	{  
		if(Test-Path $pathToKey)
		{
		$key=Get-Content $pathToKey
		}
		else
		{
		$key=""
		}
	}
    $atts.Remove("PathToKey") | Out-Null
    
    #foreach($a in Import-Csv((Get-DellBIOSEncryptionKey)))
    #{
   # $key+=$a
   # }
    $atts.Keys | foreach-object { 
                   # $atts[$_]
                    $path = $pathToCategory + '\' + $($_)
                    $value = $atts[$_]
		    if(-Not [string]::IsNullOrEmpty($securePwd))
		    {                
			$pasvar=ConvertTo-SecureString $securePwd.ToString() -Key $key
            Set-Item  -path $path -value $value -verbose -ErrorVariable ev -ErrorAction SilentlyContinue -PasswordSecure $pasvar
		    }

		    elseif(-Not [string]::IsNullOrEmpty($passwordSet))
		    {
			Set-Item  -path $path -value $value -verbose -ErrorVariable ev -ErrorAction SilentlyContinue -Password $passwordSet
		    }

		    else
		    {
			Set-Item  -path $path -value $value -verbose -ErrorVariable ev -ErrorAction SilentlyContinue
		    }
                    if ( $ev) { 
                        $cmdline = $ExecutionContext.InvokeCommand.ExpandString($ev.InvocationInfo.Line)
                        $Message = "An error occured in executing " + $cmdline + "`nError message: $($ev.ErrorDetails)"
                        Write-Verbose $Message
                        Write-DellEventLog -Message $Message -EventID 5 -EntryType "Error"
                    }
                    
                 }



}


function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$Category,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$WatchdogTimer,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$MEMSSensors,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$KeyboardBacklightOnAc,
		
		[ValidateSet("Enabled","Disabled","Auto")]
		[System.String]
		$IntegratedAudio,
		
		[ValidateSet("Enabled","Disabled","Low","Medium","High")]
		[System.String]
		$InternalSpeaker,
		
		[ValidateSet("Enabled","Disabled","EnabledPxe","OnWithImageServerBoot","EnabledwithRPLBoot","EnabledwithISCSIBoot")]
		[System.String]
		$EmbNic1,
		
		[ValidateSet("Ata","Disabled","Ahci","Raid")]
		[System.String]
		$EmbSataRaid,
		
		[ValidateSet("Off","25","50","75","100","Auto")]
		[System.String]
		$KeyboardIllumination,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$PowerButton,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$OnboardSoundDevice,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$IoModule,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$CanBus,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$UefiNwStack,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata0,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata1,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata2,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata3,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata4,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata5,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata6,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata7,
				
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Minisas0,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Minisas1,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Minisas2,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Minisas3,
		
		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel1,

		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel2,

		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel3,

		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel4,

		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel5,

		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel6,

		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel7,

		[ValidateSet("Unused","ADCInput","DACOutput","DACAndADC","GPIO")]
		[System.String]
		$AnalogDigitalInterfaceModeChannel8,		
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$SmartErrors,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$DisOsdBtn,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Hdd1FanEnable,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Hdd2FanEnable,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Hdd3FanEnable,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$LiquidCooler1,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$LiquidCooler2,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$UsbPowerShare,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Microphone,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$DockSupportOnBattery,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$UnobtrusiveMode,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Touchscreen,		

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$M2PcieSsd0,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$M2PcieSsd1,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$MmioAbove4Gb,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$IntegratedSas,		
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$OptionalBootSequence,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$NearFieldComputing,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$ForcePxeNextBoot,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$ForcePXEasFirstBootDevice,
		
		[ValidateSet("Auto","Disabled")]
		[System.String]
		$VmdPcieSlot,
						
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$VmdNvmePcie0,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$VmdNvmePcie1,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$VmdNvmePcie0Cpu1,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$VmdNvmePcie1Cpu1,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$Sata8,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$EMMCDevice,

		[System.String]
		$Password,

		[System.String]
		$SecurePassword,

		[System.String]
		$PathToKey
	)

    $Get = Get-TargetResource $PSBoundParameters['Category'] -verbose

    New-DellEventLog
 
    $PSBoundParameters.Remove("Verbose") | out-null
    $PSBoundParameters.Remove("Debug") | out-null
    $PSBoundParameters.Remove("Category") | out-null
    $PSBoundParameters.Remove("Password") | out-null
    $PSBoundParameters.Remove("SecurePassword") | out-null

    $attributes_desired = $PSBoundParameters

    $bool = $true

    foreach ($config_att in  $PSBoundParameters.GetEnumerator())
    {
        if ($Get.ContainsKey($config_att.Key)) {
            $currentvalue = $Get[$config_att.Key]
            $currentvalue_nospace = $currentvalue -replace " ", ""
            if ($config_att.Value -ne $currentvalue_nospace){
                $bool = $false
                $drift  = "`nCurrentValue: $currentvalue_nospace`nDesiredValue: $($config_att.value)"
                $message = "Configuration is drifted in category $Category for $($config_att.Key). $drift"
                write-verbose $message
                Write-DellEventLog -Message $message -EventID 4 -EntryType Warning
            
            }
            else {
                write-Debug "Configuration is same for $config_att."
            }
    }
    else
    {
        $message = "Unsupported attribute $($config_att)"
        Write-Verbose $message
    }
   }
   return $bool

}


Export-ModuleMember -Function *-TargetResource


# SIG # Begin signature block
