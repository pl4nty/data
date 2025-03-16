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

function Get-DellBiosSettings {
<#
  .Synopsis 
    retrieves all BIOS settings applicable to the system
  .Description
    This CmdLet retrieves the BIOS settings that are applicable to the system.
  .Example
    Get-DellBiosSettings
#>

 BEGIN {  }
 PROCESS {
         $DellBIOS = get-childitem -path DellSmbios:\ | select category | 
        foreach {
            get-childitem -path @("DellSmbios:\" + $_.Category)  | select attribute, currentvalue, possiblevalues, PSPath 
        }
        $DellBIOS | Out-GridView 
  }
  END{ }

  }


# SIG # Begin signature block
