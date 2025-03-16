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

function Set-Dell1stBootdevice {
<#
  .Synopsis 
    Sets a bootdevice first in the boot sequence
  .Description
    This CmdLet sets a boot device first in the boot sequence. You can specify a substring of the name of the boot device.
	If a BIOS password (Admin or System password) is set, supply it using the -Password parameter. 
  .Example
    Set-Dell1stBootdevice -bootdevice USB -password $Password
  .Example
	Set-Dell1stBootDevice hdd
#>
param(  
    [Parameter(Mandatory=$true, Position=0)][string] $Bootdevice,
    [Parameter(Mandatory=$false, Position=1)][string] $Password
  
 )

 BEGIN { 
 }
 PROCESS {
 
 #the process block is called for each item in the pipeline and you can reference it via $_
 
    $bs = Get-item -path DellSmbios:\BootSequence\Bootsequence
    $bootdevicearray = $bs.CurrentValue
    $bootdevicearray | foreach {
            if ($_.DeviceName.replace(' ','') -match ($bootdevice).replace(' ',''))
            {
                # $matches.count will include a count of all matches made from the last -match operation.
                if ($Matches.Count -gt 1)
                {
                    Write-Output "Multiple Boot devices found. Please provide a more specific name."
					break;

                } 
				
				if ($Password) {
                Set-Item -path DellSmbios:\BootSequence\BootSequence -value $_.DeviceNumber -Password $password
				}
				else
				{
					Set-Item -path DellSmbios:\BootSequence\BootSequence -value $_.DeviceNumber
				}
				
                Write-Output "Updated Bootorder is:"
                Get-Item -path DellSmbios:\BootSequence\BootSequence | select -expand currentvalue
                break;
            }
            
        }

        Write-Output "Boot device $bootdevice is not found."
  }
  END{}

  }


# SIG # Begin signature block
