function Import-Configuration {
    [CmdletBinding()]
    param (
        [xml]$BackupPlanXml,
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        [SecureString]
        $MasterPassword
    )
    
    begin {
        
    }
    
    process {
        $TempFolder = New-Item -Path "$env:TMP" -Name $BackupPlanXml.BasePlan.ID -ItemType "directory" -ErrorAction SilentlyContinue
        $BackupPlanFolder = $env:TMP+"\"+$BackupPlanXml.BasePlan.ID
        $BackupPlanPath = $env:TMP+"\"+$BackupPlanXml.BasePlan.ID+"\"+$BackupPlanXml.BasePlan.ID+".cbb"
        $BackupPlanConfiguration = $env:TMP+"\"+$BackupPlanXml.BasePlan.ID+".cbbconfiguration"
        $Arguments = "importConfig -f "+$BackupPlanConfiguration
        $BackupPlanXml.Save($BackupPlanPath)
        Add-Type -Assembly System.IO.Compression.FileSystem
        [System.IO.Compression.ZipFile]::CreateFromDirectory($BackupPlanFolder,
        $BackupPlanConfiguration, [System.IO.Compression.CompressionLevel]::Optimal, $false)
        $ProcessOutput = Start-MBSProcess -CMDPath (Get-MBSAgent).CBBCLIPath -CMDArguments $Arguments -Output none -MasterPassword $MasterPassword
        Start-Sleep -Seconds 10
        Remove-Item -Path $BackupPlanFolder -Force -Recurse
        Remove-Item -Path $BackupPlanConfiguration -Force -Recurse
        Update-MBSStorageAccount
    }
    
    end {
        
    }
}

# SIG # Begin signature block
