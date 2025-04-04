function Install-MBSAgent {
    <#
    .SYNOPSIS
        Install MBS backup agent on a local machine
    .DESCRIPTION
        Cmdlet installs MBS backup agent on a local machine
    .EXAMPLE
        PS C:\> Install-MBSAgent -URL https://s3.amazonaws.com/cb_setups/MBS/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXX/CompanyName_vX.X.X.XX.exe
        Install the MBS backup agent.
    .EXAMPLE
        PS C:\> Install-MBSAgent -URL https://s3.amazonaws.com/cb_setups/MBS/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXX/CompanyName_vX.X.X.XX.exe -Force
        Force to reinstall the MBS backup agent.
    .INPUTS
        None
    .OUTPUTS
        String
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/install-mbsagent
    #>

    [CmdletBinding()]
    param (
        # 
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName, ValueFromPipeline=$true, HelpMessage="MBS backup agent URL. Copy the link from MBS portal in Downloads section.")]
        [String]
        $URL,
        #
        [Parameter(Mandatory=$false, HelpMessage="Force to reinstall the agent")]
        [switch]
        $Force
    )
    
    begin {

    }
    
    process {
        $TempPath = "$env:TMP"
        $TempFolder = "backup"
        #$FileName = $URL.Substring($URL.LastIndexOf('/')+1)
        $FileName = Get-FileNameFromURL -URL $URL -ParseFromURLifError
        if ($FileName) {
            if (($Force) -Or (-Not(Get-MBSAgent -ErrorAction SilentlyContinue))){
                $Folder = New-Item -Path "$TempPath" -Name "$TempFolder" -ItemType "directory" -ErrorAction SilentlyContinue
                (New-Object Net.WebClient).DownloadFile("$URL", "$TempPath\$TempFolder\$FileName")
                (Start-MBSProcess -CMDPath "$TempPath\$TempFolder\$FileName" -CMDArguments "/S").stdout
                Remove-Item -Path "$TempPath\$TempFolder" -Force -Recurse
            }else{
                return "The backup agent is already installed."
            }
        }
    }
    
    end {

    }
}

# SIG # Begin signature block
