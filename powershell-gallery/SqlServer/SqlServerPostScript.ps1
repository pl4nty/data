# Define function
function SQLSERVER: { Set-Location SQLSERVER: }

# Define aliases for backward compatibility
Set-Alias -Name Encode-SqlName -Value ConvertTo-EncodedSqlName
Set-Alias -Name Decode-SqlName -Value ConvertFrom-EncodedSqlName

# Set default values for variables used by the provider
Set-Variable -scope Global -name SqlServerMaximumChildItems -Value 0
Set-Variable -scope Global -name SqlServerConnectionTimeout -Value 30
Set-Variable -scope Global -name SqlServerIncludeSystemObjects -Value $false
Set-Variable -scope Global -name SqlServerMaximumTabCompletion -Value 1000


# SIG # Begin signature block
