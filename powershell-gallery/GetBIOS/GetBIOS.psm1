<#
.Synopsis
	The Get-BIOS function allows you to list BIOS settings from your local or a remote Dell computer.
	You can query BIOS for the following manufacturer: Dell, HP, Lenovo, Toshiba
.DESCRIPTION
	Allow you to list  BIOS settings from your computer or a remote computer.
	You can query BIOS for the following manufacturer: Dell, HP, Lenovo, Toshiba.
	
	See below available parameters:
	-Computer: List BIOS settings of a remote computer
	-CSV_Path: Type the path of the CSV export
	-HTML_Path: Type the path of the HTML export
	-ShowDescription: Allows you to display a description column (for Dell only)
	-ShowGridView: Allows you to export result in out-gridview

.EXAMPLE
PS Root\> Get-BIOS 
The command above will list BIOS settings of your local computer

.EXAMPLE
PS Root\> Get-BIOS -Computer "Computer1"
The command above will list BIOS settings of the remote computer called Computer1.
It will prompt fro your credentials to access to the remote computer.

.EXAMPLE
PS Root\> Get-BIOS -HTML_Path "c:\report\export.html" -showdescription
The command above will list BIOS settings and display the description column if computer is a Dell.
It will also export BIOS settings to HTML report.

.EXAMPLE
PS Root\> Get-BIOS -CSV_Path "c:\report\export.csv" -showdescription
The command above will list BIOS settings and display the description column if computer is a Dell.
It will also export BIOS settings to CSV report.

.NOTES
    Author: Damien VAN ROBAEYS - @syst_and_deploy - http://www.systanddeploy.com
#>




function Get-Bios
{
	[CmdletBinding()]
	Param(
			[Parameter(Mandatory=$false)]
			[string]$Computer,
			[string]$CSV_Path,			
			[string]$HTML_Path,			
			[switch]$ShowDescription,
			[switch]$ShowGridView							
		 )

    Begin
    {

		$Run_As_Admin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
		If($Run_As_Admin -eq $False)
		{
			write-host ""
			write-host "########################################################" -Foreground yellow
			write-host " Please run the Get-Bios cmdlet with admin rights" -Foreground yellow
			write-host "########################################################" -Foreground yellow	
			write-host ""
			break		
		}
	
		Function Get_Dell_BIOS_Settings
			{
				$WarningPreference='silentlycontinue'
				If (Get-Module -ListAvailable -Name DellBIOSProvider)
					{} 
				Else 
					{
						Install-Module -Name DellBIOSProvider -Force 
					}
				get-command -module DellBIOSProvider | out-null
				$Script:Get_BIOS_Settings = get-childitem -path DellSmbios:\ | select-object category | 
				foreach {
					get-childitem -path @("DellSmbios:\" + $_.Category)  | select-object attribute, currentvalue, Description, PossibleValues				
				} 
				
				$Script:Get_BIOS_Settings = $Get_BIOS_Settings |  % { New-Object psobject -Property @{
					Setting = $_."attribute"
					Value = $_."currentvalue"
					Description = $_."Description"	
					"Possible values" = $_."PossibleValues"												
					}} 			
				
				If($ShowDescription)
					{
						$Get_BIOS_Settings | select-object Setting, Value, Description, "Possible values"
					}
				Else
					{
						$Get_BIOS_Settings | select-object Setting, Value, "Possible values"
					}
			}		
	
	
		Function Get_HP_BIOS_Settings
			{
				$Script:Get_BIOS_Settings = Get-WmiObject -Namespace root/hp/instrumentedBIOS -Class hp_biosEnumeration -ErrorAction SilentlyContinue |  % { New-Object psobject -Property @{				
					Setting = $_."Name"	
					"Value" = $_."currentvalue"
					"Possible Values" = $_."possiblevalues"					
					}}  | select-object Setting, "Current Value", "Possible Values"
				$Get_BIOS_Settings
			}

		Function Get_Lenovo_BIOS_Settings
			{
				$Script:Get_Available_Values = Get-WmiObject -Class Lenovo_GetBiosSelections -Namespace root\wmi
				$Script:Get_BIOS_Settings = gwmi -class Lenovo_BiosSetting -namespace root\wmi  | select-object currentsetting | Where-Object {$_.CurrentSetting -ne ""} |
				select-object @{label = "Setting"; expression = {$_.currentsetting.split(",")[0]}} , 
				@{label = "Value"; expression = {$_.currentsetting.split(",*;[")[1]}},
				@{label = "Possible values"; expression = {($Get_Available_Values.GetBiosSelections($_.currentsetting.split(",")[0])).Selections}}                                           
				$Get_BIOS_Settings
			}			
		
		Function Get_Toshiba_BIOS_Settings
			{
				Try
					{
						$Script:Get_BIOS_Settings = Get-WmiObject -NameSpace "root\wmi" -Query "SELECT * FROM QueryBiosSettings" |  % { New-Object psobject -Property @{				
							Setting = $_."CurrentSetting"
							Value = $_."Currentvalue"
							}}  | select-object Setting, Value
						$Get_BIOS_Settings
					}
				Catch
					{}
			}		

		If(($Computer -ne ""))
			{	
				$Script:Creds = get-credential
				$scriptblock = {(Get-WmiObject Win32_Computersystem).manufacturer}
				$Get_manufacturer = Invoke-Command -ComputerName $Computer -ScriptBlock $scriptblock -credential $Creds		
			}
		Else
			{
				$Get_manufacturer = (Get-WmiObject Win32_Computersystem).manufacturer
			}
	
		If($Get_manufacturer -like "*dell*")
			{
				$manufacturer = "Dell"
			}
		ElseIf($Get_manufacturer -like "*lenovo*")
			{
				$manufacturer = "Lenovo"
				If($ShowDescription)
					{
						write-warning "The parameter ShowDescription is not available for Lenovo devices"					
					}
			}
		ElseIf(($Get_manufacturer -like "*HP*") -or ($Get_manufacturer -like "*hewlet*"))
			{
				$manufacturer = "HP"
				If($ShowDescription)
					{
						write-warning "The parameter ShowDescription is not available for Lenovo devices"					
					}				
			}
		ElseIf($Get_manufacturer -like "*toshiba*")
			{
				$manufacturer = "Toshiba"
				If($ShowDescription)
					{
						write-warning "The parameter ShowDescription is not available for Lenovo devices"					
					}				
			}
		Else
			{
				write-host ""
				write-host "########################################################" -Foreground yellow
				write-host " Your manufacturer is not supported by the module" -Foreground yellow
				write-host " Supported manufacturer: Dell, HP, Lenovo, Toshiba" -Foreground yellow				
				write-host "########################################################" -Foreground yellow	
				write-host ""
				break
			}
    }
	
    Process
    {
		If($ShowGridView -eq $null)
			{
				write-host ""
				write-host "###################################################" -Foreground Cyan
				write-host "	Your manufacturer is $manufacturer" -Foreground Cyan
				write-host "###################################################" -Foreground Cyan	
				write-host ""		
			}
			
       switch ($manufacturer)
       {
           'Dell'
           {
				If(($Computer -ne ""))
					{
						$Get_BIOS_Settings = Invoke-Command  -credential $Creds -ComputerName $Computer -ScriptBlock ${Function:Get_Dell_BIOS_Settings} 																		
						$CompName = $Computer
					}
				Else
					{
						$Get_BIOS_Settings = Get_Dell_BIOS_Settings
						$CompName = $env:computername						
					}
					
				If($CSV_Path -ne "")
					{
						$Get_BIOS_Settings | Select * -ExcludeProperty "Possible values" | export-csv $CSV_Path -notype #-Delimiter ";" 
					}
			
				If($ShowGridView)
					{
						$Get_BIOS_Settings | out-gridview							
					}
				Else
					{
						$Get_BIOS_Settings
					}
					
				If($HTML_Path -ne "")
					{	
						$Date = get-date								
						$AllDatas = $Get_BIOS_Settings | Select * -ExcludeProperty "Possible values"
						If ($AllDatas -eq $null)
							{
								$Search = ""
							}
						Else
							{
								$Search = "
								<p> Type a setting to check like bootsequence or secure boot or something else to check ...</p>  

								<input class='form-control' id='myInput' type='text' placeholder='Search..'>
								"  
							}

						$head = '
						  <meta charset="utf-8">
						  <meta name="viewport" content="width=device-width, initial-scale=1">
						  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
						  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
						  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
						  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
						  '
						  
						$Title = "
						<p align='center' > 
						<img src="""" width='' height=''/>
						<br><br>
						<span class='text-primary font-weight-bold lead'>BIOS Settings on $CompName</span>
						<br><span class=text-success font-italic>This document has been updated on $Date</span></p>
						"

						$Script = '
						<script>
						$(document).ready(function(){
						  $("#myInput").on("keyup", function() {
							var value = $(this).val().toLowerCase();
							$("#myTable tr").filter(function() {
							  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
							});
						  });
						});
						</script>
						'


						$MyData = $Get_BIOS_Settings | Select * -ExcludeProperty "Possible values" |
						ConvertTo-HTML `
						-head $head -body "$title<br>$Search<br>$MyData<br>$Script"	> $HTML_Path 	

						$HTML = get-content $HTML_Path
						If($ShowDescription)
							{
								$HTML.replace("<table>",'<table class="table table-striped table-sm">').replace("<tr><th>Setting</th><th>Value</th><th>Description</th></tr>",'<thead class="thead-dark"><tr><th>Setting</th><th>Value</th><th>Description</th></tr></thead><tbody id="myTable">').replace('</table>','</tbody></table>') | out-file -encoding ASCII $HTML_Path							
							}
						Else
							{
								$HTML.replace("<table>",'<table class="table table-striped table-sm">').replace("<tr><th>Setting</th><th>Value</th></tr>",'<thead class="thead-dark"><tr><th>Setting</th><th>Value</th></tr></thead><tbody id="myTable">').replace('</table>','</tbody></table>') | out-file -encoding ASCII $HTML_Path							
							}						
						Invoke-Item $HTML_Path
					}
           }
           'HP'
           {
             Try
				{
					If(($Computer -ne ""))
						{
							$Get_BIOS_Settings = Invoke-Command  -credential $Creds -ComputerName $Computer -ScriptBlock ${Function:Get_HP_BIOS_Settings} 
							$Get_BIOS_Settings	| select Setting, Value		
							$CompName = $Computer													
						}
					Else
						{		
							$Get_BIOS_Settings = Get_HP_BIOS_Settings
							$CompName = $env:computername													
						}

					If($CSV_Path -ne "")
						{
							$Get_BIOS_Settings | Select * -ExcludeProperty "Possible values" | export-csv $CSV_Path -notype -Delimiter ";" 
						}								
					
					If($ShowGridView)
						{
							$Get_BIOS_Settings | out-gridview							
						}
					Else
						{
							$Get_BIOS_Settings
						}

					If($HTML_Path -ne "")
					{	
						$Date = get-date								
						$AllDatas = $Get_BIOS_Settings | Select * -ExcludeProperty "Possible values"
						If ($AllDatas -eq $null)
							{
								$Search = ""
							}
						Else
							{
								$Search = "
								<p> Type a setting to check like bootsequence or secure boot or something else to check ...</p>  

								<input class='form-control' id='myInput' type='text' placeholder='Search..'>
								"  
							}

						$head = '
						  <meta charset="utf-8">
						  <meta name="viewport" content="width=device-width, initial-scale=1">
						  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
						  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
						  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
						  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
						  '
						  
						$Title = "
						<p align='center' > 
						<img src="""" width='' height=''/>
						<br><br>
						<span class='text-primary font-weight-bold lead'>BIOS Settings on $CompName</span>
						<br><span class=text-success font-italic>This document has been updated on $Date</span></p>
						"

						$Script = '
						<script>
						$(document).ready(function(){
						  $("#myInput").on("keyup", function() {
							var value = $(this).val().toLowerCase();
							$("#myTable tr").filter(function() {
							  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
							});
						  });
						});
						</script>
						'

						$MyData = $Get_BIOS_Settings | Select * -ExcludeProperty "Possible values" |
						ConvertTo-HTML `
						-head $head -body "$title<br>$Search<br>$MyData<br>$Script"	> $HTML_Path 	
												
						$HTML = get-content $HTML_Path												
						If($ShowDescription)
							{
								$HTML.replace("<table>",'<table class="table table-striped table-sm">').replace("<tr><th>Setting</th><th>Value</th><th>Description</th></tr>",'<thead class="thead-dark"><tr><th>Setting</th><th>Value</th><th>Description</th></tr></thead><tbody id="myTable">').replace('</table>','</tbody></table>') | out-file -encoding ASCII $HTML_Path							
							}
						Else
							{
								$HTML.replace("<table>",'<table class="table table-striped table-sm">').replace("<tr><th>Setting</th><th>Value</th></tr>",'<thead class="thead-dark"><tr><th>Setting</th><th>Value</th></tr></thead><tbody id="myTable">').replace('</table>','</tbody></table>') | out-file -encoding ASCII $HTML_Path							
							}	
						Invoke-Item $HTML_Path										
					}
							
				}	
			Catch
				{
					Write-Warning -Message "An error occured while getting BIOS settings"
				}
					
           }
           'Lenovo'
           {
             Try
				{
					If(($Computer -ne ""))
						{
							$Get_BIOS_Settings = Invoke-Command  -credential $Creds -ComputerName $Computer -ScriptBlock ${Function:Get_Lenovo_BIOS_Settings} 		
							$Get_BIOS_Settings = $Get_BIOS_Settings	| select Setting, Value	-ExcludeProperty PSComputerName, RunspaceID, PSShowComputerName 																			
							$CompName = $Computer						
						}
					Else
						{		
							$Get_BIOS_Settings = Get_Lenovo_BIOS_Settings
							$CompName = $env:computername							
						}
						
					If($CSV_Path -ne "")
						{
							# $Get_BIOS_Settings | export-csv $CSV_Path -notype -Delimiter ";"
							$Get_BIOS_Settings | Select * -ExcludeProperty "Possible values" | export-csv $CSV_Path -notype #-Delimiter ";" 							
						}
					
					If($ShowGridView)
						{
							$Get_BIOS_Settings | out-gridview							
						}
					Else
						{
							$Get_BIOS_Settings
						}

					If($HTML_Path -ne "")
					{	
						$Date = get-date								
						# $AllDatas = $Get_BIOS_Settings 
						$AllDatas = $Get_BIOS_Settings | Select * -ExcludeProperty "Possible values"						
						If ($AllDatas -eq $null)
							{
								$Search = ""
							}
						Else
							{
								$Search = "
								<p> Type a setting to check like boot sequence, secure boot or something else to check ...</p>  

								<input class='form-control' id='myInput' type='text' placeholder='Search..'>
								"  
							}

						$head = '
						  <meta charset="utf-8">
						  <meta name="viewport" content="width=device-width, initial-scale=1">
						  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
						  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
						  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
						  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
						  '
						  
						$Title = "
						<p align='center' > 
						<img src="""" width='' height=''/>
						<br><br>
						<span class='text-primary font-weight-bold lead'>BIOS Settings on $CompName</span>
						<br><span class=text-success font-italic>This document has been updated on $Date</span></p>
						"

						$Script = '
						<script>
						$(document).ready(function(){
						  $("#myInput").on("keyup", function() {
							var value = $(this).val().toLowerCase();
							$("#myTable tr").filter(function() {
							  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
							});
						  });
						});
						</script>
						'


						# $MyData = $Get_BIOS_Settings |
						$MyData = $Get_BIOS_Settings | Select * -ExcludeProperty "Possible values" |												
						ConvertTo-HTML -head $head -body "$title<br>$Search<br>$MyData<br>$Script" > $HTML_Path 	

						$HTML = get-content $HTML_Path												
						If($ShowDescription)
							{
								$HTML.replace("<table>",'<table class="table table-striped table-sm">').replace("<tr><th>Setting</th><th>Value</th><th>Description</th></tr>",'<thead class="thead-dark"><tr><th>Setting</th><th>Value</th><th>Description</th></tr></thead><tbody id="myTable">').replace('</table>','</tbody></table>') | out-file -encoding ASCII $HTML_Path							
							}
						Else
							{
								$HTML.replace("<table>",'<table class="table table-striped table-sm">').replace("<tr><th>Setting</th><th>Value</th></tr>",'<thead class="thead-dark"><tr><th>Setting</th><th>Value</th></tr></thead><tbody id="myTable">').replace('</table>','</tbody></table>') | out-file -encoding ASCII $HTML_Path							
							}	
						Invoke-Item $HTML_Path					
					}								
				}
			Catch
				{
					Write-Warning -Message "An error occured while getting BIOS settings"
				}
           }
		   
           'Toshiba'
           {
             Try
				{
					If(($Computer -ne ""))
						{
							$Get_BIOS_Settings = Invoke-Command  -credential $Creds -ComputerName $Computer -ScriptBlock ${Function:Get_Toshiba_BIOS_Settings} 		
							$Get_BIOS_Settings	| select Setting, Value	
							$CompName = $Computer													
						}
					Else
						{
							$CompName = $env:computername												
							$Get_BIOS_Settings = Get_Toshiba_BIOS_Settings
							If($CSV_Path -ne "")
								{
									$Get_BIOS_Settings | export-csv $CSV_Path -notype -Delimiter ";"
								}
							
							If($ShowGridView)
								{
									$Get_BIOS_Settings | out-gridview							
								}
							Else
								{
									$Get_BIOS_Settings
								}

							If($HTML_Path -ne "")
							{	
								$Date = get-date								
								$AllDatas = $Get_BIOS_Settings 
								If ($AllDatas -eq $null)
									{
										$Search = ""
									}
								Else
									{
										$Search = "
										<p> Type a setting to check like bootsequence or secure boot or something else to check ...</p>  

										<input class='form-control' id='myInput' type='text' placeholder='Search..'>
										"  
									}

								$head = '
								  <meta charset="utf-8">
								  <meta name="viewport" content="width=device-width, initial-scale=1">
								  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
								  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
								  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
								  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
								  '
								  
								$Title = "
								<p align='center' > 
								<img src="""" width='' height=''/>
								<br><br>
								<span class='text-primary font-weight-bold lead'>BIOS Settings on $CompName</span>
								<br><span class=text-success font-italic>This document has been updated on $Date</span></p>
								"

								$Script = '
								<script>
								$(document).ready(function(){
								  $("#myInput").on("keyup", function() {
									var value = $(this).val().toLowerCase();
									$("#myTable tr").filter(function() {
									  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
									});
								  });
								});
								</script>
								'


						$MyData = $Get_BIOS_Settings |
						ConvertTo-HTML `
						-head $head -body "$title<br>$Search<br>$MyData<br>$Script"	> $HTML_Path 	
								
						$HTML = get-content $HTML_Path												
						If($ShowDescription)
							{
								$HTML.replace("<table>",'<table class="table table-striped table-sm">').replace("<tr><th>Setting</th><th>Value</th><th>Description</th></tr>",'<thead class="thead-dark"><tr><th>Setting</th><th>Value</th><th>Description</th></tr></thead><tbody id="myTable">').replace('</table>','</tbody></table>') | out-file -encoding ASCII $HTML_Path							
							}
						Else
							{
								$HTML.replace("<table>",'<table class="table table-striped table-sm">').replace("<tr><th>Setting</th><th>Value</th></tr>",'<thead class="thead-dark"><tr><th>Setting</th><th>Value</th></tr></thead><tbody id="myTable">').replace('</table>','</tbody></table>') | out-file -encoding ASCII $HTML_Path							
							}	
						Invoke-Item $HTML_Path										
							}
						}
				}
			Catch
				{
					Write-Warning -Message "An error occured while getting BIOS settings"
				}
			}
		}
	}
    End
		{
		}
}