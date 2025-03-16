function Install-CONAgent {
    <#
    .SYNOPSIS
        Install Connect agent on a local machine
    .DESCRIPTION
        Cmdlet installs Connect agent on a local machine
    .EXAMPLE
        PS C:\> Install-CONAgent -URL https://mspbackups.com/downloads/ConnectSetup/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
        Install the Connect agent using the URL
    .EXAMPLE
        PS C:\> Install-CONAgent -ConfigurationID xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx 
        Install the Connect agent using the Configuration ID
    .EXAMPLE
        PS C:\> Install-CONAgent -URL https://mspbackups.com/downloads/ConnectSetup/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx -Force
        Force to reinstall the Connect agent.
    .INPUTS
        None
    .OUTPUTS
        String
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/connect-agent/install-conagent
    #>

    [CmdletBinding()]
    param (
        # 
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName, ValueFromPipeline=$true, HelpMessage="Connect agent URL. Copy the link from MBS portal in Downloads section.", ParameterSetName='ByURL')]
        [String]
        $URL,
        # 
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName, ValueFromPipeline=$true, HelpMessage="Configuration ID.", ParameterSetName='ByID')]
        [String]
        $ConfigurationID,
        #
        [Parameter(Mandatory=$false, HelpMessage="Force to reinstall the agent")]
        [switch]
        $Force
    )
        
    begin {
	
    }
    
	
    process {
        $TempPath = "$env:TMP"
        $TempFolder = "connect"
        switch ($PSCmdlet.ParameterSetName) {
            'ByID' {
                $URL = "https://download.mspbackups.com/ConnectSetup.exe"
                $FileName = "ConnectSetup.exe"
                $Arguments = "/S /t=$ConfigurationID"
            }
            'ByURL' {
                #$ID = $URL.Substring($URL.LastIndexOf("/")+1)
                #$FileName = "ConnectSetup_t$ID.exe"
                $FileName = Get-FileNameFromURL -URL $URL -ParseFromURLifError
                $Arguments = "/S"
            }
        }
        if ($FileName) {
            if (($Force) -Or (-Not(Get-CONAgent -ErrorAction SilentlyContinue))) {
                $Folder = New-Item -Path "$TempPath" -Name "$TempFolder" -ItemType "directory" -ErrorAction SilentlyContinue
                (New-Object Net.WebClient).DownloadFile("$URL", "$TempPath\$TempFolder\$FileName")
                (Start-MBSProcess -CMDPath "$TempPath\$TempFolder\$FileName" -CMDArguments "$Arguments").stdout
                Remove-Item -Path "$TempPath\$TempFolder" -Force -Recurse
            }else{
                return "The Connect agent is already installed."
            }
        }
    }
    
    end {

    }
}

# SIG # Begin signature block
