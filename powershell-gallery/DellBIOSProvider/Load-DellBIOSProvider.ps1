<#
Load-DellBIOSProvider.ps1
#############################################################################
 
  Copyright 2015-2018 Dell Inc.  All rights reserved.
 
  THIS SOFTWARE IS DISTRIBUTED IN THE HOPE THAT IT WILL BE USEFUL, BUT IS
  PROVIDED “AS IS” WITHOUT ANY WARRANTY, EXPRESS, IMPLIED OR OTHERWISE,
  INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTY OF MERCHANTABILITY OR
  FITNESS FOR A PARTICULAR PURPOSE OR ANY WARRANTY REGARDING TITLE OR
  AGAINST INFRINGEMENT.  IN NO EVENT SHALL DELL BE LIABLE FOR ANY DIRECT,
  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTUTUTE GOODS OR
  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
  IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  POSSIBILITY OF SUCH DAMAGE.
  
#############################################################################
#>

# This is a sample script that works for Dell Command | PowerShell Provider 64-bit Module; however, this script can be modified for 32-bit module. 

if ( 2 -eq $PSVersionTable.PSVersion.Major )
{
    "PowerShell version is 2.x which is not supported as of now."
    break
}

# Check if module is already imported or loaded into the current session
if (get-module -name DellBIOSProvider) {
    Write-Host "DellBIOSProvider has been imported in the current session. exiting."
    break
}


# Module must already be copied to the path on your local computer in $Dellmodulepath\DellBIOSProvider
$DellModulePath = "${env:ProgramFiles}\Dell\PowerShell\Modules\"

 
$p = [Environment]::GetEnvironmentVariable("PSModulePath")

# Have the user set the env var machine or user only once. 
$Paths = $p.Split(";")
if ($Paths.Contains($DellModulePath))
{
    Write-Host $DellModulePath "is already added to PSModulePath."
}
else
{
    $p += ";$DellModulePath"
	#Environment variable target, Choose from "Process", "User", "Machine". Default is current process.
	$target = "Machine"  
    [Environment]::SetEnvironmentVariable("PSModulePath",$p, $target)
   
}


# Write-Host "Creating module directory"
# New-Item -Type Container -Force -path $DellModulePath | out-null



if (Test-path -path $DellModulePath\DellBIOSProvider) 
{
	cd $DellModulePath\DellBIOSProvider
	import-module .\DellBIOSProvider.psd1 -Verbose
	
	cd DellSmbios:
}

else {
	Write-Host "Please check the path where module is copied." 
}

# import a module from a remote computer
# $s = New-PSSession -ComputerName Server01
# Get-Module -PSSession $s -ListAvailable -Name DellBIOSProvider
#Import-Module -PSSession $s -Name DellBIOSProvider
# SIG # Begin signature block
