function Install-RMMAgent {
    <#
    .SYNOPSIS
        Install RMM agent on a local machine
    .DESCRIPTION
        Cmdlet installs RMM agent on a local machine
    .EXAMPLE
        PS C:\> Install-RMMAgent -URL https://s3.amazonaws.com/cb_setups/MBS/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXX/Brands/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXX/CompanyNameRMMAgent_vX.X.X.XXX.exe
        Install the RMM agent.
    .EXAMPLE
        PS C:\> Install-RMMAgent -URL https://s3.amazonaws.com/cb_setups/MBS/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXX/Brands/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXX/CompanyNameRMMAgent_vX.X.X.XXX.exe -Force
        Force to reinstall the RMM agent.
    .INPUTS
        None
    .OUTPUTS
        String
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/rmm-agent/install-rmmagent
    #>

    [CmdletBinding()]
    param (
        # 
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName, ValueFromPipeline=$true, HelpMessage="RMM agent URL. Copy the link from MBS portal in Downloads section.")]
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
        $TempFolder = "rmm"
        #$FileName = $URL.Substring($URL.LastIndexOf('/')+1)
        $FileName = Get-FileNameFromURL -URL $URL -ParseFromURLifError
        if ($FileName) {
            if (($Force) -Or (-Not(Get-RMMAgent -ErrorAction SilentlyContinue))) {
                $Folder = New-Item -Path "$TempPath" -Name "$TempFolder" -ItemType "directory" -ErrorAction SilentlyContinue
                (New-Object Net.WebClient).DownloadFile("$URL", "$TempPath\$TempFolder\$FileName")
                (Start-MBSProcess -CMDPath "$TempPath\$TempFolder\$FileName" -CMDArguments "/S").stdout
                Remove-Item -Path "$TempPath\$TempFolder" -Force -Recurse
            }else{
                return "The RMM agent is already installed."
            }
        }
    }
    
    end {

    }
}

# SIG # Begin signature block
