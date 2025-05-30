function Write-HostAndLog {
    param(
    $Message,
    [String]$FilePath,
    [boolean]$showMessage = $true
    )
    if($showMessage){Write-Host "$Message"}
    (Get-Date -Format g) + " $Message" | Out-File -FilePath $FilePath -Append
}

# SIG # Begin signature block
