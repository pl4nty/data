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

Function Clear-DellAdminPassword {
<#
  .Synopsis 
    Erases the Admin (Setup) BIOS password
  .Description
    This CmdLet clears the Admin password in BIOS. Provide the existing password using -Password parameter.
  .Example
    Clear-DellAdminPassword -Password <existing password>
#>
param(  
    [Parameter(Mandatory=$true)][string] $Password
	  
 )

 BEGIN { 
        
 }
 PROCESS {
     Set-Item DellSmbios:\Security\AdminPassword -value "" -password $Password -ErrorVariable ev
	 if ($ev){
              Write-Warning "$ev Error occured in $($ev.InvocationInfo.ScriptName)"    		
	}	
 }
 END{}

  }

# SIG # Begin signature block
