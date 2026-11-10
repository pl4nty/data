function Get-Feature
{
    Write-Debug ($LocalizedData.ProviderApiDebugMessage -f ('Get-Feature'))
    Write-Output -InputObject (New-Feature $script:SupportsPSModulesFeatureName )
}
# SIG # Begin signature block
