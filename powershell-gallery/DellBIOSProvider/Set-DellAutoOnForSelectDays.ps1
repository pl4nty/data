##########################################################################
# DELL PROPRIETARY INFORMATION
#
# This software is confidential.  Dell Inc., or one of its subsidiaries, has supplied this
# software to you under the terms of a license agreement,nondisclosure agreement or both.
# You may not copy, disclose, or use this software except in accordance with those terms.
#
# Copyright 2020 Dell Inc. or its subsidiaries.  All Rights Reserved.
#
# DELL INC. MAKES NO REPRESENTATIONS OR WARRANTIES ABOUT THE SUITABILITY OF THE SOFTWARE,
# EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT.
# DELL SHALL NOT BE LIABLE FOR ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING,
# MODIFYING OR DISTRIBUTING THIS SOFTWARE OR ITS DERIVATIVES.
#
#
#
##########################################################################

function Set-DellAutoOnForSelectDays {
<#
  .Synopsis 
    Configures the system's auto-on capabilities that control individual days
  .Description
    This CmdLet sets the Auto-on to select days and enables or disables the individual days
    to automatically power on the system on a pre fixed .
	If a BIOS password (Admin or System password) is set, supply it using the -Password parameter. 
  .Example
    Set-DellAutoonForSelectDays -Sunday "Enabled" -Monday "Disabled" -password $Password
  .Example
	Set-DellAutoonForSelectDays -Tuesday "Enabled"
  .Example
    Set-DellAutoOnForSelectDays -verbose
#>
[CmdletBinding()]
param(  
    [Alias("Sun")][System.String] $Sunday,
    [Alias("Mon")][System.String] $Monday,
    [Alias("Tue")][System.String] $Tuesday,
    [Alias("Wed")][System.String] $Wednesday,
    [Alias("Thu")][System.String] $Thursday,
    [Alias("Fri")][System.String] $Friday,
    [Alias("Sat")][System.String] $Saturday,
    [Alias("pw")][Parameter(Mandatory=$false)][System.String] $Password
  
 )

 BEGIN { 
        Write-Output "Set-DellAutoOnForSelectDays"
 }
 PROCESS {
    #the process block is called for each item in the pipeline and you can reference it via $_
    #Write-Output "in process"

    $pathToPowerManagement = 'DellSmbios' + ':\' + 'PowerManagement'
    
    
    $isAdminPWSet  = Get-Item -path DellSmbios:\Security\IsAdminPasswordSet
    $issystemPWSet = Get-Item -path DellSmbios:\Security\IsSystemPasswordSet

    if (($isAdminPWSet.CurrentValue -match 'True') -or ($issystemPWSet.CurrentValue -match 'True')) 
    {
        if ([string]::IsNullOrEmpty($Password)){
        Write-Warning "Specify the password using -password."
        return
        }
    }

    
    if ($Password){
        Set-Item -path $pathToPowerManagement\AutoOn -value "SelectDays" -password $Password -ErrorVariable ev
    }
    else{   Set-Item -path $pathToPowerManagement\AutoOn -value "SelectDays" -ErrorVariable ev}

	if ($ev){
              Write-Warning "$ev Error occured in $($ev.InvocationInfo.ScriptName)"  
			  return
	}		
	
    if ($PSBoundParameters.ContainsKey('Sunday')) {
        if ($password){    
                Set-Item -path DellSmbios:\PowerManagement\AutoOnSun -value $Sunday -password $Password -ErrorVariable ev
         }
         else {Set-Item -path DellSmbios:\PowerManagement\AutoOnSun -value $Sunday -ErrorVariable ev}
        
    }
    if ($PSBoundParameters.ContainsKey('Monday')) {
         if ($password){ 
            Set-Item -path $pathToPowerManagement\AutoOnMon -value $Monday -password $Password -ErrorVariable ev
         }
         else {Set-Item -path DellSmbios:\PowerManagement\AutoOnMon -value $Monday -ErrorVariable ev}
    }
    if ($PSBoundParameters.ContainsKey('Tuesday')) {
         if ($password){ 
            Set-Item -path $pathToPowerManagement\AutoOnTue -value $Tuesday -password $Password -ErrorVariable ev
         }
         else {Set-Item -path DellSmbios:\PowerManagement\AutoOnTue -value $Tuesday -ErrorVariable ev}
    }
    if ($PSBoundParameters.ContainsKey('Wednesday')) {
         if ($password){ 
            Set-Item -path $pathToPowerManagement\AutoOnWed -value $Wednesday -password $Password -ErrorVariable ev
         }
         else {Set-Item -path DellSmbios:\PowerManagement\AutoOnWed -value $Wednesday -ErrorVariable ev}
    }
    if ($PSBoundParameters.ContainsKey('Thursday')) {
         if ($password){ 
            Set-Item -path $pathToPowerManagement\AutoOnThur -value $Thursday -password $Password -ErrorVariable ev
         }
         else {Set-Item -path DellSmbios:\PowerManagement\AutoOnThur -value $Thursday -ErrorVariable ev}
    }
    if ($PSBoundParameters.ContainsKey('Friday')) {
         if ($password){ 
            Set-Item -path $pathToPowerManagement\AutoOnFri -value $Friday -password $Password -ErrorVariable ev
         }
         else {Set-Item -path DellSmbios:\PowerManagement\AutoOnFri -value $Friday -ErrorVariable ev}
    }
     if ($PSBoundParameters.ContainsKey('Saturday')) {
         if ($password){ 
            Set-Item -path $pathToPowerManagement\AutoOnSat -value $Saturday -password $Password -ErrorVariable ev
         }
         else {Set-Item -path DellSmbios:\PowerManagement\AutoOnSat -value $Saturday -ErrorVariable ev}
    }
    if ($ev){
              Write-Warning "$ev Error occured in $($ev.InvocationInfo.ScriptName)"    		
	}			
  }
  END{}

  }


# SIG # Begin signature block
