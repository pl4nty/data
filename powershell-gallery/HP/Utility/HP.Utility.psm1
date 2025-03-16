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



<#
.SYNOPSIS
  Returns true if user is running with elevated privileges

.DESCRIPTION
  This command returns true if the user is running with elevated administrator privileges, otherwise returns false.

.EXAMPLE
   Test-IsElevatedAdmin
#>
function Test-IsElevatedAdmin
{
  [CmdletBinding(HelpUri = "https://developers.hp.com/hp-client-management/doc/Test-IsElevatedAdmin")]
  param()
  $user = [Security.Principal.WindowsIdentity]::GetCurrent();
  (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

<#
.SYNOPSIS
  This is a private command for internal use only. Convert an XML to an indented string document

.DESCRIPTION
  This is a private command for internal use only. This command takes an XML document and returns a prettified text version of the document, suitable for printing or writing to a file.

.PARAMETER xml
  Specifies the XML object to format

.PARAMETER Indent
  Specifies the number of spaces to indent. If not specified, default is 2.

.EXAMPLE
  $xml | Format-XmlToText

.NOTES
  - This is a private function for internal use only
#>
function Format-XmlToText {
  [CmdletBinding()]
  param(
    [Parameter(ValueFromPipeline = $true,Mandatory = $true,Position = 0)]
    [xml]$xml,
    [Parameter(Mandatory = $false,Position = 1)]
    [int]$Indent = 2
  )
  $StringWriter = New-Object System.IO.StringWriter
  $XmlWriter = New-Object System.Xml.XmlTextWriter $StringWriter
  $xmlWriter.Formatting = 'indented'
  $xmlWriter.Indentation = $Indent
  $xml.WriteContentTo($XmlWriter)
  $XmlWriter.Flush()
  $StringWriter.Flush()
  $StringWriter.ToString()
}


Export-ModuleMember -Function 'Test-*'
Export-ModuleMember -Function 'Format-*'

# SIG # Begin signature block
