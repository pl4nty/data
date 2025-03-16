function Test-MBSStorageAccount {
    <#
    .SYNOPSIS
    Test network connection to cloud or local backup storage.
    
    .DESCRIPTION
    The cmdlet get information from the backup storage and test connection with Test-NexConnection cmdlet.
    
    .PARAMETER StorageAccount
    Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name "AWS S3").
    
    .PARAMETER Name
    Backup storage name.
    
    .PARAMETER ID
    Backup storage ID.
    
    .EXAMPLE
    Get-MBSStorageAccount | Test-MBSStorageAccount | ft -AutoSize

    Get all MBS backup storages and test them in pipeline.

    .EXAMPLE
    Test-MBSStorageAccount -StorageAccount (Get-MBSStorageAccount -Name "AWS S3")

    Test backup storage connection with "AWS S3" name by providing backup storage object to "StorageAccount" parameter.

    .EXAMPLE
    Test-MBSStorageAccount -Name "AWS S3"

    Test backup storage connection with "AWS S3" name

    .EXAMPLE
    Test-MBSStorageAccount -ID d32111fa-53db-4ae0-800a-8601a06ca2d7

    Test backup storage connection with d32111fa-53db-4ae0-800a-8601a06ca2d7 ID.

    .INPUTS
        MBS.Agent.StorageAccount

    .OUTPUTS
        MBS.Agent.TestStorageAccountResult

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/test-mbsstorageaccount
    #>

    [CmdletBinding()]
    param (
        # Storage account object
        [Parameter(Mandatory=$true, HelpMessage="Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")", ParameterSetName='StorageAccount', ValueFromPipeline)]
        [MBS.Agent.StorageAccount]
        $StorageAccount,
        # Storage account name
        [Parameter(Mandatory=$true, HelpMessage="Specify storage account name", ParameterSetName='Name')]
        [string]
        $Name,
        # Storage account ID
        [Parameter(Mandatory=$true, HelpMessage="Specify storage account ID", ParameterSetName='ID')]
        [string]
        $ID
    )
    
    begin {
        
    }
    
    process {
        if ($StorageAccount) {
           
        }elseif ($Name) {
            $StorageAccount = Get-MBSStorageAccount -Name $Name
        }elseif ($ID) {
            $StorageAccount = Get-MBSStorageAccount -ID $ID
        }else {
            Write-Error "Parameter is not specified."
            break
        }
        $Result = New-Object -TypeName MBS.Agent.TestStorageAccountResult
        
        switch ($StorageAccount.SGCloudTypeValue) {
            'AzureVM' {
                Write-Warning "Azure VM account is not supported."
            }
            {$_ -in "","PhysicalFile"} {
                $Result.Name = $StorageAccount.DisplayName 
                if ($StorageAccount.Type -eq "FileSystemConnection") {
                    $StoragePath = $StorageAccount.Path
                }else{
                    $StoragePath = $StorageAccount.Bucket
                }
                if (Split-Path -qualifier $StoragePath -ErrorAction SilentlyContinue) {
                    $Result.HostName = 'localhost'
                    $Result.RemoteAddress = '127.0.0.1'
                }elseif($URI = new-object System.Uri($StoragePath)){
                    $Result.HostName = $URI.Host
                    $Result.RemoteAddress = if($IP = Resolve-DnsName -Name $URI.Host -ErrorAction SilentlyContinue){$IP[0].IPAddress}
                }else{
                    Write-Warning "$($StorageAccount.DisplayName) account is not supported."
                }
                $Result.TestSucceeded = Test-Path $("filesystem::$($StoragePath)")
            }
            {$_ -in "Minio","S3Compatible"} {
                $script:Options = @{
                    ComputerName = $(if($StorageAccount.SGHttpsEndPoint){$StorageAccount.SGHttpsEndPoint.Split(':')[0]}else{$StorageAccount.SGEndPoint.Split(':')[0]})
                    Port = $(if($StorageAccount.SGHttpsEndPoint){if($StorageAccount.SGHttpsEndPoint.Split(':')[1]){$StorageAccount.SGHttpsEndPoint.Split(':')[1]}else{443}}else{$StorageAccount.SGEndPoint.Split(':')[1]})
                }
            }
            Default {
                $script:Options = @{
                    ComputerName = $StorageAccount.SGHttpsEndPoint
                    Port = 443
                }
            }
        }
        
        if ($script:Options) {
            $Test = Test-NetConnection @script:Options -WarningAction SilentlyContinue
            $Result.Name = $StorageAccount.DisplayName 
            $Result.HostName = $Test.ComputerName
            $Result.RemotePort = $Test.RemotePort
            $Result.RemoteAddress = $Test.RemoteAddress
            $Result.TestSucceeded = $Test.TcpTestSucceeded
        }
        Remove-Variable -Name "Options" -Scope Script -Force -ErrorAction SilentlyContinue
        if ($Result.Name){return $Result}
    }
    
    end {
        
    }
}
# SIG # Begin signature block
