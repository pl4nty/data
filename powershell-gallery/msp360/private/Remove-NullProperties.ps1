function Remove-NullProperties {
    [cmdletbinding()]
    param(
        # Object to remove null values from
        [parameter(ValueFromPipeline,Mandatory)]
        [object[]]$InputObject,
        #By default, remove empty strings (""), specify -LeaveEmptyStrings to leave them.
        [switch]$LeaveEmptyStrings
    )
    process {
        foreach ($obj in $InputObject) {
            $AllProperties = $obj.psobject.properties.Name
            $NonNulls = $AllProperties |
                where-object {$null -ne $obj.$PSItem} |
                where-object {$LeaveEmptyStrings.IsPresent -or -not [string]::IsNullOrEmpty($obj.$PSItem)}
            $obj | Select-Object -Property $NonNulls
        }
    }
}

# SIG # Begin signature block
