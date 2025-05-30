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
		$BlockDefinition
	)

	#Write-Verbose "Use this cmdlet to deliver information about command processing."

	#Write-Debug "Use this cmdlet to write debug information while troubleshooting."


	<#
	$returnValue = @{
		BlockDefinition = [System.String]
		Category = [System.String]
		AutoOn = [System.String]
		AutoOnHr = [System.UInt16]
		AutoOnMn = [System.UInt16]
		AutoOnSun = [System.String]
		AutoOnMon = [System.String]
		AutoOnTue = [System.String]
		AutoOnWed = [System.String]
		AutoOnThur = [System.String]
		AutoOnFri = [System.String]
		AutoOnSat = [System.String]
		DeepSleepCtrl = [System.String]
		FanSpeed = [System.String]
		FanSpeedLvl = [System.UInt16]
		UsbWake = [System.String]
		FanCtrlOvrd = [System.String]
		AcPwrRcvry = [System.String]
		WakeOnLan = [System.String]
		SfpwakeOnLan = [System.String]
		WakeOnAc = [System.String]
		WakeOnDock = [System.String]
		LidSwitch = [System.String]
		BlinkPowerSupply1LED = [System.String]
		BlinkPowerSupply2LED = [System.String]
		WlanAutoSense = [System.String]
		WwanAutoSense = [System.String]
		BlockSleep = [System.String]
		SleepMode = [System.String]
		PrimaryBattChargeCfg = [System.String]
		CustomChargeStart = [System.UInt16]
		CustomChargeStop = [System.UInt16]
		SliceBattChargeCfg = [System.String]
		ModBattChargeCfg = [System.String]
		DockBatteryChargeConfiguration = [System.String]
		IntlSmartConnect = [System.String]
		IntelReadyModeEn = [System.String]
		PeakShiftCfg = [System.String]
		PeakShiftBatteryThreshold = [System.UInt16]
		PeakShiftDayConfiguration = [System.String]
		StartTime = [System.String]
		EndTime = [System.String]
		ChargeStartTime = [System.String]
		AdvBatteryChargeCfg = [System.String]
		AdvancedBatteryChargeConfiguration = [System.String]
		Type_CBatteryOverloadProtection = [System.String]
		BeginningOfDay = [System.String]
		WorkPeriod = [System.String]		
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
		$BlockDefinition,

		[System.String]
		$Category,

		[ValidateSet("EveryDay","Disabled","WeekDays","SelectDays")]
		[System.String]
		$AutoOn,

		[System.UInt16]
		$AutoOnHr,

		[System.UInt16]
		$AutoOnMn,
		
		[System.UInt16]
		$AutoWakePeriod,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnSun,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnMon,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnTue,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnWed,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnThur,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnFri,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnSat,

		[ValidateSet("Disabled","S5Only","S4AndS5")]
		[System.String]
		$DeepSleepCtrl,

		[ValidateSet("Auto","High","Med","Low","MedHigh","MedLow")]
		[System.String]
		$FanSpeed,

		[System.UInt16]
		$FanSpeedLvl,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$UsbWake,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$FanCtrlOvrd,

		[ValidateSet("Off","On","Last")]
		[System.String]
		$AcPwrRcvry,

		[ValidateSet("AddInCard","Onboard","Disabled","LanOnly","LanWithPxeBoot","WlanOnly","LanWlan")]
		[System.String]
		$WakeOnLan,

		[ValidateSet("SFP","LANSFP","SFPPXE")]
		[System.String]
		$SfpwakeOnLan,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$WakeOnAc,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$WakeOnDock,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$LidSwitch,

		[ValidateSet("Enabled")]
		[System.String]
		$BlinkPowerSupply1LED,

		[ValidateSet("Enabled")]
		[System.String]
		$BlinkPowerSupply2LED,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$WlanAutoSense,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$WwanAutoSense,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$BlockSleep,

		[ValidateSet("OSAutomaticSelection","ForceS3")]
		[System.String]
		$SleepMode,

		[ValidateSet("Auto","Standard","Express","PrimAcUse","Custom")]
		[System.String]
		$PrimaryBattChargeCfg,

		[System.UInt16]
		$CustomChargeStart,

		[System.UInt16]
		$CustomChargeStop,

		[ValidateSet("Standard","Express")]
		[System.String]
		$SliceBattChargeCfg,

		[ValidateSet("Standard","Express")]
		[System.String]
		$ModBattChargeCfg,

		[ValidateSet("Standard","Express")]
		[System.String]
		$DockBatteryChargeConfiguration,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$IntlSmartConnect,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$IntelReadyModeEn,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$PeakShiftCfg,
		
		[ValidateSet("LanOnly","Disabled","LanWithPxeBoot")]
		[System.String]
		$WakeOnLan2,

		[System.UInt16]
		$PeakShiftBatteryThreshold,

		[System.String]
		$PeakShiftDayConfiguration,

		[System.String]
		$StartTime,

		[System.String]
		$EndTime,

		[System.String]
		$ChargeStartTime,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AdvBatteryChargeCfg,

		[System.String]
		$AdvancedBatteryChargeConfiguration,

		[ValidateSet("7.5Watts","15Watts")]
		[System.String]
		$Type_CBatteryOverloadProtection,

		[System.String]
		$BeginningOfDay,

		[System.String]
		$WorkPeriod,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$SpeedShift,

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
    if ( !$DellPSDrive) {
        $Message = "Drive DellSmbios is not found. Exiting."
        Write-Verbose $Message
        Write-DellEventLog -Message $Message -EventID 3 -EntryType "Error"
        return $true
    }

      
    $atts = $PSBoundParameters

    $pathToCategory = $DellPSDrive.Name + ':\' + $atts["Category"]
    
    Dir $pathToCategory -verbose

    $atts.Remove("Verbose") | out-null
    $atts.Remove("Category") | out-null
    $atts.Remove("Debug") | out-null
    $atts.Remove("BlockDefinition") | out-null
    $startTime=$atts['StartTime']
    $endTime=$atts['EndTime']
    $chargeStartTime=$atts['ChargeStartTime']
	$atts.Remove("StartTime") | out-null
	$atts.Remove("EndTime") | out-null
	$atts.Remove("ChargeStartTime") | out-null
    $beginningOfDay=$atts['BeginningOfDay']
    $workPeriod=$atts['WorkPeriod']
    $atts.Remove("BeginningOfDay") | out-null
	$atts.Remove("WorkPeriod") | out-null
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

    $atts.Keys | foreach-object {
					
                    if($($_) -eq "PeakShiftDayConfiguration")
                    {
                     $path = $pathToCategory + '\' + $($_)
                    $value = $atts[$_]
					if(-Not [string]::IsNullOrEmpty($securePwd))
					{                
					$pasvar=ConvertTo-SecureString $securePwd.ToString() -Key $key
					Set-Item  -path $path -value $value -StartTime $startTime -EndTime $endTime -ChargeStartTime $chargeStartTime -verbose -ErrorVariable ev -ErrorAction SilentlyContinue -PasswordSecure $pasvar
					}

					elseif(-Not [string]::IsNullOrEmpty($passwordSet))
					{
					Set-Item  -path $path -value $value -StartTime $startTime -EndTime $endTime -ChargeStartTime $chargeStartTime -verbose -ErrorVariable ev -ErrorAction SilentlyContinue -Password $passwordSet
					}

					else
					{
					Set-Item  -path $path -value $value -StartTime $startTime -EndTime $endTime -ChargeStartTime $chargeStartTime -verbose -ErrorVariable ev -ErrorAction SilentlyContinue
					}
                    
                    if ( $ev) { 
                        $cmdline = $ExecutionContext.InvokeCommand.ExpandString($ev.InvocationInfo.Line)
                        $Message = "An error occured in executing " + $cmdline + "`nError message: $($ev.ErrorDetails)"
                        Write-Verbose $Message
                        Write-DellEventLog -Message $Message -EventID 5 -EntryType "Error"
                    }
                    }
					
					elseif($($_) -eq "AdvancedBatteryChargeConfiguration")
                    {
                     $path = $pathToCategory + '\' + $($_)
                    $value = $atts[$_]
					
					if(-Not [string]::IsNullOrEmpty($securePwd))
					{                
					$pasvar=ConvertTo-SecureString $securePwd.ToString() -Key $key
					Set-Item  -path $path -value $value -BeginningOfDay $beginningOfDay -WorkPeriod $workPeriod -verbose -ErrorVariable ev -ErrorAction SilentlyContinue -PasswordSecure $pasvar
					}

					elseif(-Not [string]::IsNullOrEmpty($passwordSet))
					{
					Set-Item  -path $path -value $value -BeginningOfDay $beginningOfDay -WorkPeriod $workPeriod -verbose -ErrorVariable ev -ErrorAction SilentlyContinue -Password $passwordSet
					}

					else
					{
					Set-Item  -path $path -value $value -BeginningOfDay $beginningOfDay -WorkPeriod $workPeriod -verbose -ErrorVariable ev -ErrorAction SilentlyContinue
					}
					
                    
                    if ( $ev) { 
                        $cmdline = $ExecutionContext.InvokeCommand.ExpandString($ev.InvocationInfo.Line)
                        $Message = "An error occured in executing " + $cmdline + "`nError message: $($ev.ErrorDetails)"
                        Write-Verbose $Message
                        Write-DellEventLog -Message $Message -EventID 5 -EntryType "Error"
                    }
                    }
					
                     else
                     {
                     $path=""
                        if($($_) -eq "Type_CBatteryOverloadProtection")
                    {
                    $path = $pathToCategory + '\' + "Type-CBatteryOverloadProtection"
                    }					 

                    else
                    {
                    $path = $pathToCategory + '\' + $($_)
                    }
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


}


function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$BlockDefinition,

		[System.String]
		$Category,

		[ValidateSet("EveryDay","Disabled","WeekDays","SelectDays")]
		[System.String]
		$AutoOn,

		[System.UInt16]
		$AutoOnHr,

		[System.UInt16]
		$AutoOnMn,
		
		[System.UInt16]
		$AutoWakePeriod,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnSun,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnMon,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnTue,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnWed,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnThur,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnFri,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnSat,

		[ValidateSet("Disabled","S5Only","S4AndS5")]
		[System.String]
		$DeepSleepCtrl,

		[ValidateSet("Auto","High","Med","Low","MedHigh","MedLow")]
		[System.String]
		$FanSpeed,

		[System.UInt16]
		$FanSpeedLvl,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$UsbWake,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$FanCtrlOvrd,

		[ValidateSet("Off","On","Last")]
		[System.String]
		$AcPwrRcvry,

		[ValidateSet("AddInCard","Onboard","Disabled","LanOnly","LanWithPxeBoot","WlanOnly","LanWlan")]
		[System.String]
		$WakeOnLan,

		[ValidateSet("SFP","LANSFP","SFPPXE")]
		[System.String]
		$SfpwakeOnLan,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$WakeOnAc,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$WakeOnDock,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$LidSwitch,

		[ValidateSet("Enabled")]
		[System.String]
		$BlinkPowerSupply1LED,

		[ValidateSet("Enabled")]
		[System.String]
		$BlinkPowerSupply2LED,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$WlanAutoSense,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$WwanAutoSense,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$BlockSleep,

		[ValidateSet("OSAutomaticSelection","ForceS3")]
		[System.String]
		$SleepMode,

		[ValidateSet("Auto","Standard","Express","PrimAcUse","Custom")]
		[System.String]
		$PrimaryBattChargeCfg,

		[System.UInt16]
		$CustomChargeStart,

		[System.UInt16]
		$CustomChargeStop,

		[ValidateSet("Standard","Express")]
		[System.String]
		$SliceBattChargeCfg,

		[ValidateSet("Standard","Express")]
		[System.String]
		$ModBattChargeCfg,

		[ValidateSet("Standard","Express")]
		[System.String]
		$DockBatteryChargeConfiguration,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$IntlSmartConnect,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$IntelReadyModeEn,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$PeakShiftCfg,

		[System.UInt16]
		$PeakShiftBatteryThreshold,

		[System.String]
		$PeakShiftDayConfiguration,

		[System.String]
		$StartTime,

		[System.String]
		$EndTime,

		[System.String]
		$ChargeStartTime,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AdvBatteryChargeCfg,

		[System.String]
		$AdvancedBatteryChargeConfiguration,

		[ValidateSet("7.5Watts","15Watts")]
		[System.String]
		$Type_CBatteryOverloadProtection,

		[System.String]
		$BeginningOfDay,

		[System.String]
		$WorkPeriod,
				
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$SpeedShift,
		
		[ValidateSet("LanOnly","Disabled","LanWithPxeBoot")]
		[System.String]
		$WakeOnLan2,

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

    $startTime=$PSBoundParameters['StartTime']
    $endTime=$PSBoundParameters['EndTime']
    $chargestartTime=$PSBoundParameters['ChargeStartTime']
	$beginningOfDay=$PSBoundParameters['BeginningOfDay']
	$workPeriod=$PSBoundParameters['WorkPeriod']

    $PSBoundParameters.Remove("StartTime") | out-null
    $PSBoundParameters.Remove("EndTime") | out-null
    $PSBoundParameters.Remove("ChargeStartTime") | out-null
	$PSBoundParameters.Remove("BeginningOfDay") | out-null
	$PSBoundParameters.Remove("WorkPeriod") | out-null
    $PSBoundParameters.Remove("BlockDefinition") | out-null

   $bool = $true

  
   foreach ($config_att in  $PSBoundParameters.GetEnumerator())
   {
    if ($Get.ContainsKey($config_att.Key)) {
    if($config_att.Key -match "PeakShiftDayConfiguration")
    {
    $currentvalue = $Get[$config_att.Key]
    $whichDay=$config_att.Value


    if($whichDay -eq "Monday")
    {
    $iIndex=0
    }

    elseif($whichDay -eq "Tuesday")
    {
    $iIndex=1
    }

    elseif($whichDay -eq "Wednesday")
    {
    $iIndex=2
    }

        elseif($whichDay -eq "Thursday")
    {
    $iIndex=3
    }

        elseif($whichDay -eq "Friday")
    {
    $iIndex=4
    }

        elseif($whichDay -eq "Saturday")
    {
    $iIndex=5
    }

        elseif($whichDay -eq "Sunday")
    {
    $iIndex=6
    }

            if (($currentvalue[$iIndex].StartTime -ne $startTime) -or ($currentvalue[$iIndex].EndTime -ne $endTime) -or ($currentvalue[$iIndex].ChargeStartTime -ne $chargestartTime)){
            $bool = $false
            #$drift  = "`nCurrentValue: $currentvalue_nospace`nDesiredValue: $($config_att.value)"
            $drift  = "`nCurrentValue: StartTime "+$currentvalue[$iIndex].StartTime+" EndTime "+$currentvalue[$iIndex].EndTime+" ChargeStartTime "+$currentvalue[$iIndex].ChargeStartTime+"`nDesiredValue: StartTime "+$startTime+" EndTime "+$endTime+" ChargeStartTime "+$chargestartTime
            $message = "Configuration is drifted in category $Category for $($config_att.Key). $drift"
           
            write-verbose $message
            Write-DellEventLog -Message $message -EventID 4 -EntryType Warning
            
        }
        else {
            write-Debug "Configuration is same for $config_att."
        
        }

    }

	elseif($config_att.Key -match "AdvancedBatteryChargeConfiguration")
    {
    $currentvalue = $Get[$config_att.Key]
    $whichDay=$config_att.Value


    if($whichDay -eq "Monday")
    {
    $iIndex=0
    }

    elseif($whichDay -eq "Tuesday")
    {
    $iIndex=1
    }

    elseif($whichDay -eq "Wednesday")
    {
    $iIndex=2
    }

        elseif($whichDay -eq "Thursday")
    {
    $iIndex=3
    }

        elseif($whichDay -eq "Friday")
    {
    $iIndex=4
    }

        elseif($whichDay -eq "Saturday")
    {
    $iIndex=5
    }

        elseif($whichDay -eq "Sunday")
    {
    $iIndex=6
    }

            if (($currentvalue[$iIndex].BeginningOfDay -ne $beginningOfDay) -or ($currentvalue[$iIndex].WorkPeriod -ne $workPeriod)){
            $bool = $false
            #$drift  = "`nCurrentValue: $currentvalue_nospace`nDesiredValue: $($config_att.value)"
            $drift  = "`nCurrentValue: BeginningOfDay "+$currentvalue[$iIndex].BeginningOfDay+" WorkPeriod "+$currentvalue[$iIndex].WorkPeriod+"`nDesiredValue: BeginningOfDay "+$beginningOfDay+" WorkPeriod "+$workPeriod
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
     $currentvalue=""
    if($config_att.Key -match "Type_CBatteryOverloadProtection")
    {
    $currentvalue = $Get["Type-CBatteryOverloadProtection"]
    }
    else
    {
        $currentvalue = $Get[$config_att.Key]
    }
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

    }
    else {
        $message = "Unsupported attribute $($config_att)."
        Write-Verbose $message
    }
  }
  

   return $bool
}


Export-ModuleMember -Function *-TargetResource


# SIG # Begin signature block
