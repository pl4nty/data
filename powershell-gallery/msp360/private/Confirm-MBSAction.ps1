function Confirm-MBSAction {
    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$True)]
        [String]
        $Operation,
        #
        [Parameter(Mandatory=$True)]
        [String]
        $Target
    )
    
    begin {
        
    }
    
    process {
        Write-Host "Are you sure you want to perform this action?"
        Write-Host "Performing the operation ""$Operation"" on target ""$Target"""
        Write-Host "[Y] Yes  [N] No (default is ""N""):" -NoNewline
        $Input = Read-Host 
        if ($Input -eq "Y" -or $Input -eq "y" ){
            return $true
        }else{
            return $false
        }
    }
    
    end {
        
    }
}

# SIG # Begin signature block
