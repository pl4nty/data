function Convert-ToMBSType {
    [CmdletBinding()]
    param (
        [string]
        $MBSType,
        [psobject]
        $object
    )
    
    begin {
        
    }
    
    process {
        $MBSObject = New-Object -TypeName $MBSType
        ($MBSObject | get-member -MemberType Properties).Name | ForEach-Object -Process {
            #Write-host $_
            #if($object."$_".GetType().Name -eq "Object[]"){
            #    Write-Host $MBSObject."$_".GetType()
            #    Convert-ToMBSType -MBSType $MBSObject."$_".GetType() -object $object."$_"
            #}else{
                $MBSObject."$_" = $object."$_"
            #}
        }
        return $MBSObject
    }
    
    end {
        
    }
}
# SIG # Begin signature block
