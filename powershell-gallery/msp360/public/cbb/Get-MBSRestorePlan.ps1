function Get-MBSRestorePlan {
    <#
    .SYNOPSIS
        Get restore plans from MBS backup agent.
    .EXAMPLE
        PS C:\> Get-MBSRestorePlan -StorageType All -PlanType All
        Lists all restore plans
    .EXAMPLE
        PS C:\> Get-MBSRestorePlan -StorageType Local -PlanType All
        Lists only restore plans with a local destination.
    .EXAMPLE
        PS C:\> Get-MBSRestorePlan -StorageType Cloud -PlanType All
        Lists only restore plans with a cloud destination.
    .EXAMPLE
        PS C:\> Get-MBSRestorePlan -StorageType All -PlanType File-Level
        Lists all File-level restore plans.
    .EXAMPLE
        PS C:\> Get-MBSRestorePlan -StorageType All -PlanType Image-Based
        Lists all Image-Based restore plans.
    .EXAMPLE
        PS C:\> Get-MBSRestorePlan -StorageType Local -PlanType Image-Based
        Lists Image-Based restore plans with a local destination.
    .INPUTS
        None
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/get-mbsrestoreplan
    #>

    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$false, HelpMessage="Destination storage type.")]
        [ValidateSet("All", "Local", "Cloud")]
        [string]
        $StorageType = "All",
        #
        [Parameter(Mandatory=$false, HelpMessage="Restore plan type.")]
        [ValidateSet("All", "File-Level", "Image-Based", "MSSQL","MSExchange","VMware","Hyper-V")]
        [string]
        $PlanType = "All",
        #
        [Parameter(Mandatory=$false, HelpMessage="Backup plan type.")]
        [ValidateSet("Full", "Raw")]
        [string]
        $OutputType = "Full"
    )

    begin {
        if (-not($CBB = Get-MBSAgent)) {
            Break
        }
    }

    process {
    function Add-PlanContent ($BasePlan) {
        $Plans  = New-Object -TypeName psobject
        $Plans | Add-Member -MemberType NoteProperty -Name Name -Value $BasePlan.Name
        $Plans | Add-Member -MemberType NoteProperty -Name ID -Value $BasePlan.ID
        $Plans | Add-Member -MemberType NoteProperty -Name Type -Value $BasePlan.Type
        $Plans | Add-Member -MemberType NoteProperty -Name Bucket -Value $BasePlan.Bucket
        return $Plans
    }

    function Compare-StorageTypes {
        param (
            $Account,
            [string]$StorageType
        )

        $result = $false
        switch -exact ($StorageType) {
            "All" {$result = $true}
            "Cloud" { 
                if($Account.SGCloudTypeValue -ne "FileSystemConnection" -and $Account.SGCloudTypeValue -ne "PhysicalFile"){
                    $result = $true 
                }else {
                    $result = $false
                }
            }
            "Local" {
                if($Account.SGCloudTypeValue -eq "FileSystemConnection" -or $Account.SGCloudTypeValue -eq "PhysicalFile"){
                    $result = $true 
                }else {
                    $result = $false
                }
            }
            Default {}
        }
        return $result
    }

        $CBBProgramData = $CBB.CBBProgramData
        $PlansArray = @()
        foreach ($_ in (Get-ChildItem ("$CBBProgramData") -Filter "*.cbb" -ErrorAction SilentlyContinue)){ 
            if (Get-Content $_.FullName){
                $Plan = [xml](Get-Content ($_.FullName))
                switch ($PlanType) {
                    All 
                    { 
                        if ($Plan.BasePlan.type -notlike "Backup*" -and $Plan.BasePlan.type -ne "ConsistencyCheckPlan" -and $Plan.BasePlan.type -ne "Plan"){
                            if(Compare-StorageTypes -Account (Get-MBSStorageAccount -ID $Plan.BasePlan.ConnectionID) -StorageType $StorageType){
                                $PlansArray += Convert-XMLtoPSObject $Plan.BasePlan
                            }
                        }
                    }
                    File-Level 
                    { 
                        if ($Plan.BasePlan.type -eq "RestorePlan"){
                            if(Compare-StorageTypes -Account (Get-MBSStorageAccount -ID $Plan.BasePlan.ConnectionID) -StorageType $StorageType){
                                $PlansArray += Convert-XMLtoPSObject $Plan.BasePlan
                            }
                        }
                    }
                    Image-Based 
                    {
                        if ($Plan.BasePlan.type -eq "RestoreDiskImagePlan") {
                            if(Compare-StorageTypes -Account (Get-MBSStorageAccount -ID $Plan.BasePlan.ConnectionID) -StorageType $StorageType){
                                $PlansArray += Convert-XMLtoPSObject $Plan.BasePlan
                            }
                        }
                    }
                    MSSQL 
                    {
                        if ($Plan.BasePlan.type -eq "RestoreDatabasePlan") {
                            if(Compare-StorageTypes -Account (Get-MBSStorageAccount -ID $Plan.BasePlan.ConnectionID) -StorageType $StorageType){
                                $PlansArray += Convert-XMLtoPSObject $Plan.BasePlan
                            }
                        }
                    }
                    MSExchange 
                    {
                        if ($Plan.BasePlan.type -eq "RestoreExchangePlan") {
                            if(Compare-StorageTypes -Account (Get-MBSStorageAccount -ID $Plan.BasePlan.ConnectionID) -StorageType $StorageType){
                                $PlansArray += Convert-XMLtoPSObject $Plan.BasePlan
                            }
                        }
                    }
                    VMware 
                    {
                        if ($Plan.BasePlan.type -eq "RestoreVirtualMachinesESXiPlan") {
                            if(Compare-StorageTypes -Account (Get-MBSStorageAccount -ID $Plan.BasePlan.ConnectionID) -StorageType $StorageType){
                                $PlansArray += Convert-XMLtoPSObject $Plan.BasePlan
                            }
                        }
                    }
                    Hyper-V 
                    {
                        if ($Plan.BasePlan.type -eq "RestoreVirtualMachinesHyperVPlan") {
                            if(Compare-StorageTypes -Account (Get-MBSStorageAccount -ID $Plan.BasePlan.ConnectionID) -StorageType $StorageType){
                                $PlansArray += Convert-XMLtoPSObject $Plan.BasePlan
                            }
                        }
                    }
                    Default {Write-Error -message "Incorrect PlanType parameter"}
                }
            }
        }
        switch ($OutputType) {
            Full {
                $PlansArray = $PlansArray | Select -Property * -ExcludeProperty xsd, xsi, Tag
            }
            Raw {
                $PlansArray = $PlansArray | Select *
            }
            Default {Write-Error -message "Incorrect OutputType parameter"}
        }
        return $PlansArray
    }

    end {

    }
}

# SIG # Begin signature block
