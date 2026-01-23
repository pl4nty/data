Set-Variable AdalClientId -option Constant -value '1950a258-227b-4e31-a9cf-717495945fc2'
Set-Variable AdalRedirectUri -option Constant -value 'https://login.microsoftonline.com/common/oauth2/nativeclient'
New-Variable -Name UserAccount -Scope Script -Force
New-Variable -Name PublicClient -Scope Script -Force

<#
.SYNOPSIS
Gets one or more Whiteboards from the Microsoft Whiteboard service and returns them as objects.

.PARAMETER UserId
The ID of the user account to query Whiteboards for.

.PARAMETER WhiteboardId
(Optional) The ID of a specific Whiteboard to query, if not specified all whiteboards are queried.

.PARAMETER ForceAuthPrompt
(Optional) Always prompt for auth. Use to ignore cached credentials.

.EXAMPLE
Get-Whiteboard -UserId 00000000-0000-0000-0000-000000000001
Get all of a user's Azure Whiteboards.
#>
function Get-Whiteboard
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [Guid]$UserId,

        [Parameter(Mandatory=$false)]
        [Guid]$WhiteboardId,
        
        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt)

    $response = Send-GetWhiteboardsRequest `
        -UserId $UserId `
        -ForceAuthPrompt:$ForceAuthPrompt

    if ($null -eq $WhiteboardId)
    {
        # Filter out items that do not have fluidFileId
        return $response | Where-Object {-not $_.fluidFileId}
    }

    # Filter client-side since there is no admin GET API that addresses a single whiteboard.
    return $response | Where-Object {-not $_.fluidFileId -and $_.id -eq $WhiteboardId}
}

<#
.SYNOPSIS
Gets one or more Whiteboards from the Microsoft Whiteboard service and returns them as objects.

.PARAMETER UserId
The ID of the user account to query Whiteboards for.

.PARAMETER WhiteboardId
(Optional) The ID of a specific Whiteboard to query, if not specified all whiteboards are queried.

.PARAMETER ForceAuthPrompt
(Optional) Always prompt for auth. Use to ignore cached credentials.

.EXAMPLE
Get-WhiteboardsMigrated -UserId 00000000-0000-0000-0000-000000000001
Get all of a user's Fluid Whiteboards.
#>
function Get-WhiteboardsMigrated
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [Guid]$UserId,

        [Parameter(Mandatory=$false)]
        [string]$ConnectMgGraph = $null, 

        [Parameter(Mandatory=$false)]
        [string]$ContinuationToken = $null, 
        
        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt,
        
        [Parameter(Mandatory=$false)]
        [string]$IncrementalRunName)

    if(!($ConnectMgGraph -eq 'NotRequired')) {
        Connect-MgGraph -Scopes "User.Read.All", "Files.Read.All", "Sites.Read.All", "Sites.ReadWrite.All"    
    }
    
    $response = Send-GetSharepointWhiteboardsRequest `
        -user $UserId `
        -ContinuationToken $ContinuationToken `
        -WhiteboardType 'Migrated' `
        -ForceAuthPrompt:$ForceAuthPrompt

    if ($response) {
        Write-Host "Drive Items found for User $UserId ---------------------------------------------------"
    
        $lines = @()

        # Iterate through each item in driveItems.value
        foreach ($item in $response.value) {
        $lines += "Name: $($item.name)"
        $lines += "ID: $($item.id)"
        $lines += "Last Modified: $($item.lastModifiedDateTime)"
        $lines += "Size: $($item.size) bytes"
        $lines += "Migration Date: $($item.createdDateTime)"
        $lines += "User ID: $($item.createdBy.user.id)"
        $lines += "User Email: $($item.createdBy.user.email)"
        $lines += "User Name: $($item.createdBy.user.displayName)"
        $lines += "-----------------------------------------------"
        }

        $incrementalResults = -not [string]::IsNullOrEmpty($IncrementalRunName)
        if($ConnectMgGraph -eq 'NotRequired' -and $incrementalResults) {
            $whiteboardResultsFileName = "WhiteboardsMigrated-$IncrementalRunName.txt"
            Add-Content -Path $whiteboardResultsFileName -Value (ConvertTo-Json $lines)
        } else {
            Write-Host $($lines -join "`n")
        }
    }
}

function Get-OriginalFluidWhiteboards
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [Guid]$UserId,

        [Parameter(Mandatory=$false)]
        [string]$ConnectMgGraph = $null, 

        [Parameter(Mandatory=$false)]
        [string]$ContinuationToken = $null, 
        
        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt,
        
        [Parameter(Mandatory=$false)]
        [string]$IncrementalRunName)

    if(!($ConnectMgGraph -eq 'NotRequired')) {
        Connect-MgGraph -Scopes "User.Read.All", "Files.Read.All", "Sites.Read.All", "Sites.ReadWrite.All"    
    }

    $response = Send-GetSharepointWhiteboardsRequest `
        -user $UserId `
        -ContinuationToken $ContinuationToken `
        -WhiteboardType 'Fluid' `
        -ForceAuthPrompt:$ForceAuthPrompt

    if ($response) {
        Write-Host "Drive Items found for User $UserId ---------------------------------------------------"

        $lines = @()

        # Iterate through each item in driveItems.value
        foreach ($item in $response.value) {
        $lines += "Name: $($item.name)"
        $lines += "ID: $($item.id)"
        $lines += "Last Modified: $($item.lastModifiedDateTime)"
        $lines += "Size: $($item.size) bytes"
        $lines += "Migration Date: $($item.createdDateTime)"
        $lines += "User ID: $($item.createdBy.user.id)"
        $lines += "User Email: $($item.createdBy.user.email)"
        $lines += "User Name: $($item.createdBy.user.displayName)"
        $lines += "-----------------------------------------------"
        }

        $incrementalResults = -not [string]::IsNullOrEmpty($IncrementalRunName)
        if($ConnectMgGraph -eq 'NotRequired' -and $incrementalResults) {
            $whiteboardResultsFileName = "WhiteboardsOriginalFluid-$IncrementalRunName.txt"
            Add-Content -Path $whiteboardResultsFileName -Value (ConvertTo-Json $lines)
        } else {
            Write-Host $($lines -join "`n")
        }
    }
}

function Get-OriginalFluidWhiteboardsForTenant
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false)]
        [string]$IncrementalRunName,

        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt)

    try{
        Connect-MgGraph -Scopes "User.Read.All", "Files.Read.All", "Sites.Read.All", "Sites.ReadWrite.All"
        # Get all users in the tenant
        $users = Get-MgUser -All -ResponseHeadersVariable headers -ErrorAction Stop | Select-Object -ExpandProperty Id
        $requestId = $headers['request-id']
	    $clientRequestId = $headers['client-request-id']
        $userIds_count = $users | Measure-Object | Select-Object -ExpandProperty Count
        Write-Verbose "Successfully fetched total $userIds_count user accounts."
        Write-Verbose "Users are: $users"
    } catch {
        Write-Host "Failed to fetch user accounts with REQUEST ID: $requestId  CLIENT REQUEST ID: $clientRequestId."
    }
    $incrementalResults = -not [string]::IsNullOrEmpty($IncrementalRunName)
    if($incrementalResults) {
        $whiteboardResultsFileName = "WhiteboardsOriginalFluid-$IncrementalRunName.txt"
        if (Test-Path -Path $whiteboardResultsFileName) {
            Clear-Content -Path $whiteboardResultsFileName
        }
    }

    foreach ($user in $users) {
        Get-OriginalFluidWhiteboards -UserId $user -ForceAuthPrompt:$ForceAuthPrompt -ConnectMgGraph 'NotRequired' -IncrementalRunName $IncrementalRunName
    }
}

function Send-GetWhiteboardsRequest
{
    param(
        [Parameter(Mandatory=$true)]
        [Guid]$UserId,
        
        [Parameter(Mandatory=$false)]
        [hashtable]$Headers,
        
        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt)
 
    $response = Invoke-WhiteboardRequest `
        -Method GET `
        -Endpoint "api/v1.0/users/$UserId/whiteboards" `
        -ContentType 'application/json' `
        -Headers $Headers `
        -ForceAuthPrompt:$ForceAuthPrompt
        
    return $response
}

function ExtractRequestIdsFromError
{
    $requestId = $null
    $clientRequestId = $null

    # Try to extract request IDs from ErrorDetails.Message (Graph SDK errors)
    if ($_.ErrorDetails -and $_.ErrorDetails.Message) {
        $errorDetails = $_.ErrorDetails.Message
        if ($errorDetails -match 'request-id\s*:\s*([a-f0-9-]+)') {
            $requestId = $Matches[1]
        }
        if ($errorDetails -match 'client-request-id\s*:\s*([a-f0-9-]+)') {
            $clientRequestId = $Matches[1]
        }
    }

    return @{ RequestId = $requestId; ClientRequestId = $clientRequestId }
}

function Send-GetSharepointWhiteboardsRequest
{
    param(
        [Parameter(Mandatory=$true)]
        [Guid]$user,

        [Parameter(Mandatory=$true)]
        [string]$WhiteboardType,

        [Parameter(Mandatory=$false)]
        [string]$ContinuationToken = $null, 
        
        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt)
 
    try{
    	# Get the drive ID of the user
    	$Drives =  Get-MgUserDrive -UserId $user -ResponseHeadersVariable headers -ErrorAction Stop | Select-Object -ExpandProperty Id
	    $requestId = if ($headers) { $headers['request-id'] } else { $null }
	    $clientRequestId = if ($headers) { $headers['client-request-id'] } else { $null }
        Write-Host "DriveIds for user $user are $Drives"
    } catch {
        $errorMessage = $_.Exception.ToString()
        
        $requestIds = ExtractRequestIdsFromError
        $requestId = $requestIds.RequestId
        $clientRequestId = $requestIds.ClientRequestId

        if ($errorMessage -eq 'System.Exception: [accessDenied] : Access denied') {
            Write-Host "Admin does not have access to User $user OneDrive with REQUEST ID: $requestId  CLIENT REQUEST ID: $clientRequestId."
        } else {
            Write-Host "OneDrive not found for user $user with REQUEST ID: $requestId  CLIENT REQUEST ID: $clientRequestId."
        }
	    return $null
    }

    $allDriveItems = @()

    if($Drives) {
        foreach($DriveId in $Drives){
            # Get migrated whiteboard documents from the user's drive
            try { 
                if($WhiteboardType -eq 'Migrated') {
                    $Uri = "https://graph.microsoft.com/v1.0/drives/$DriveId/root:/Whiteboards/Migration:/children"
                } else {
                    $Uri = "https://graph.microsoft.com/v1.0/drives/$DriveId/root:/Whiteboards:/children"
                }
                Write-Host "Fetching drive items for User $user with DriveID $DriveId."

                $driveItems = Invoke-MgGraphRequest -Method GET -Uri $Uri -ResponseHeadersVariable headers
                $requestId = if ($headers) { $headers['request-id'] } else { $null }
	            $clientRequestId = if ($headers) { $headers['client-request-id'] } else { $null }

                if (-not $driveItems) {
                    Write-Host "No drive items found for User $user with DriveID $DriveId for REQUEST ID: $requestId  CLIENT REQUEST ID: $clientRequestId."
                    continue
                }
                
                $allDriveItems += $driveItems.value
                $itemCount = $driveItems.value.Count
                Write-Host "Found $itemCount drive items for User $user with DriveID $DriveId for REQUEST ID: $requestId  CLIENT REQUEST ID: $clientRequestId."
                
            } catch {
                $requestIds = ExtractRequestIdsFromError
                $requestId = $requestIds.RequestId
                $clientRequestId = $requestIds.ClientRequestId

                Write-Host "No drive items found for User $user with DriveID $DriveId for REQUEST ID: $requestId  CLIENT REQUEST ID: $clientRequestId."
            }
        }
        # Only return after checking all drives
        if ($allDriveItems.Count -gt 0) {
            return @{ value = $allDriveItems }
        }

        Write-Host "No drive items found for User $user after checking all drives."
        return $null
    }
}

<#
.SYNOPSIS
Gets all of the board owners from the Microsoft Whiteboard service in a given geography.
The response is a JSON object with the following properties:
  Items:
    A list of strings containing the owner ids
  ContinuationToken:
    A continuation token to pass in future calls to this API. The token can expire when new results are computed.
    In this case a 410 is returned, and the call should be retried with a null continuation token. When this
    situation occurs, duplicate owner ids may be returned. If null, there are no more owners to return.
  Geography:
    The geography for which this results were calculated.
  TenantId:
    The tenant ID these owners belong to.


This data is not live calculated, and instead is based on cached values that are calculated
every 2-4 weeks. As a result, admins should be aware that this may be an incomplete list.

.PARAMETER Geography
The geography to look up whiteboards in. Valid options are "Europe", "Australia", and "Worldwide".
"Worldwide" contains all data not stored in Europe or Australia. At the time of writing, this data
is stored in the US.

.PARAMETER ContinuationToken
(Optional) A continuation token based on the last time this function was called. Due to the large 
volume of boards in a tenant, results are returned in chunks at a time, with a continuation token
to signify where to pick up from. To start from the beginning, pass in null.

.PARAMETER ForceAuthPrompt
(Optional) Always prompt for auth. Use to ignore cached credentials.
#>
function Get-WhiteboardOwners
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet('Worldwide', 'Europe', 'Australia')]
        [string]$Geography,

        [Parameter(Mandatory=$false)]
        [string]$ContinuationToken = $null, 

        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt)
    
    $response = Send-GetWhiteboardOwnersRequest `
        -Geography $Geography `
        -ContinuationToken $ContinuationToken `
        -ForceAuthPrompt:$ForceAuthPrompt

    return $response
}

function Send-GetWhiteboardOwnersRequest
{
    param(
        [Parameter(Mandatory=$true)]
        [string]$Geography,

        [Parameter(Mandatory=$false)]
        [string]$ContinuationToken = $null, 
        
        [Parameter(Mandatory=$false)]
        [hashtable]$Headers,
        
        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt)
 
    if ($Headers -eq $null) {
        $Headers = @{}
    }
    if (!$Headers.ContainsKey("x-ms-continuation")){
    $Headers.Add("x-ms-continuation", $ContinuationToken)
    }
    if (!$Headers.ContainsKey("x-ms-continuationToken")){
    $Headers.Add("x-ms-continuationToken", $ContinuationToken)
    }

    $response = Invoke-WhiteboardRequest `
        -Method GET `
        -Endpoint "api/v1.0/admin/whiteboardowners/geographies/$Geography" `
        -ContentType 'application/json' `
        -ForceAuthPrompt:$ForceAuthPrompt `
        -Headers $Headers
        
    return $response
}

<#
.SYNOPSIS
Sets the owner for a Whiteboard.

.PARAMETER WhiteboardId
The Whiteboard for which the owner is being changed.

.PARAMETER OldOwnerId
The ID of the previous owner.

.PARAMETER NewOwnerId
The ID of the new owner.

.PARAMETER ForceAuthPrompt
(Optional) Always prompt for auth. Use to ignore cached credentials.

.EXAMPLE
Set-WhiteboardOwner -OldOwnerId 00000000-0000-0000-0000-000000000001 -NewOwnerId 00000000-0000-0000-0000-000000000002
Move a Whiteboard from one user to another.
#>
function Set-WhiteboardOwner
{
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact='High')]
    param(
        [Parameter(Mandatory=$true)]
        [Guid]$WhiteboardId,

        [Parameter(Mandatory=$true)]
        [Guid]$OldOwnerId,

        [Parameter(Mandatory=$true)]
        [Guid]$NewOwnerId,

        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt)

    if ($PSCmdlet.ShouldProcess("Whiteboard: $WhiteboardId"))
    {
        return Invoke-WhiteboardRequest `
            -Method PATCH `
            -Endpoint "api/v1.0/users/$OldOwnerId/whiteboards/$WhiteboardId" `
            -ContentType 'application/json-patch+json' `
            -Body (ConvertTo-Json -Compress @(@{"op"="replace"; "path"="/OwnerId"; "value"=$NewOwnerId })) `
            -ForceAuthPrompt:$ForceAuthPrompt
    }
}

<#
.SYNOPSIS
Transfer ownership of all Whiteboards owned by a user to another user.

.PARAMETER OldOwnerId
The ID of the previous owner.

.PARAMETER NewOwnerId
The ID of the new owner.

.PARAMETER WhatIf
Execute the command without making any actual changes. Only calls read methods on the REST service.

.PARAMETER ForceAuthPrompt
(Optional) Always prompt for auth. Use to ignore cached credentials.

.EXAMPLE
Invoke-TransferAllWhiteboards -OldOwnerId 00000000-0000-0000-0000-000000000001 -NewOwnerId 00000000-0000-0000-0000-000000000002 -WhatIf
Check how many Whiteboards will be transferred without transferring them.

.EXAMPLE
Invoke-TransferAllWhiteboards -OldOwnerId 00000000-0000-0000-0000-000000000001 -NewOwnerId 00000000-0000-0000-0000-000000000002
Transfer (and prompt before performing any write actions).
#>
function Invoke-TransferAllWhiteboards
{
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact='High')]
    param(
        [Parameter(Mandatory=$true)]
        [Guid]$OldOwnerId,

        [Parameter(Mandatory=$true)]
        [Guid]$NewOwnerId,

        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt)

    $whiteboards = Get-Whiteboard -UserId $OldOwnerId -ForceAuthPrompt:$ForceAuthPrompt

    # Only transfer Whiteboards actually owned by this Id
    $whiteboardsOwned = @($whiteboards | Where-Object { [Guid]::Parse($_.ownerId) -eq $OldOwnerId })
    Write-Verbose "Found $($whiteboardsOwned.Length) Whiteboards for owner $($OldOwnerId)"

    if ($PSCmdlet.ShouldProcess("Whiteboards for Owner: $OldOwnerId"))
    {
        $whiteboardsOwned | ForEach-Object {
            Set-WhiteboardOwner -OldOwnerId $OldOwnerId -NewOwnerId $NewOwnerId -WhiteboardId $_.id -Confirm:$false
        }
    }
}

<#
.SYNOPSIS
Deletes the specified Whiteboard for the given user from the Microsoft Whiteboard service. If the user is the owner of the whiteboard,
the entire whiteboard will be deleted. If the user has joined the whiteboard but does not own it, they will be removed and the whiteboard
will still be accessible by others.

.PARAMETER UserId
The ID of the user account to delete the Whiteboard from.

.PARAMETER WhiteboardId
The ID of a specific Whiteboard to delete.

.PARAMETER ForceAuthPrompt
(Optional) Always prompt for auth. Use to ignore cached credentials.

.EXAMPLE
Remove-Whiteboard -UserId 00000000-0000-0000-0000-000000000001 -WhiteboardId 00000000-0000-0000-0000-000000000002
Deletes the whiteboard
#>
function Remove-Whiteboard
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [Guid]$UserId,

        [Parameter(Mandatory=$true)]
        [Guid]$WhiteboardId,

        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt)
        
    if ($PSCmdlet.ShouldProcess("Delete whiteboard $WhiteboardId for User $UserId?"))
    {
        Invoke-WhiteboardRequest `
            -Method DELETE `
            -Endpoint "api/v1.0/users/$UserId/whiteboards/$WhiteboardId" `
            -ContentType 'application/json' `
            -ForceAuthPrompt:$ForceAuthPrompt
    }
}

<#
.SYNOPSIS
Gets tenant settings from the Microsoft Whiteboard service and returns them as an object.

.PARAMETER ForceAuthPrompt
(Optional) Always prompt for auth. Use to ignore cached credentials.

.EXAMPLE
Get-WhiteboardSettings

Get the users Whiteboard settings.
#>
function Get-WhiteboardSettings
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt)

    $response = Invoke-WhiteboardRequest `
        -Method GET `
        -Endpoint "api/v1.0/whiteboards/enabled" `
        -ForceAuthPrompt:$ForceAuthPrompt

    return $response
}

<#
.SYNOPSIS
Sets the tenant settings for the Microsoft Whiteboard services.

.PARAMETER Settings
The object to use as Whiteboard Settings. Should be retrieved via Get-WhiteboardSettings

.PARAMETER ForceAuthPrompt
(Optional) Always prompt for auth. Use to ignore cached credentials.

.EXAMPLE
$settings = Get-WhiteboardSettings
$settings.isEnabledGa = $true
Set-WhiteboardSettings -Settings $settings

Enables Microsoft Whiteboard for your tenant.
#>
function Set-WhiteboardSettings
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [psobject]$Settings,

        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt)

    $jsonSettings = ConvertTo-Json $Settings
    $response = Invoke-WhiteboardRequest `
        -Method POST `
        -Endpoint "api/v1.0/whiteboards/enabled" `
        -ContentType 'application/json' `
        -Body $jsonSettings `
        -ForceAuthPrompt:$ForceAuthPrompt

    return $response
}


<#
.SYNOPSIS
Gets all the whiteboards associated with a tenant in a specific geography.

.PARAMETER Geography
The geography to grab the whiteboards from. Valid options are Australia, Europe, or Worldwide.

.PARAMETER IncrementalRunName
(Optional) Saves incremental progess as the cmdlet runs. Use to resume a partially completed Get-WhiteboardsForTenant.
Use the same IncrementalRunName on later calls to continue a previously cancelled/failed run
Writes progress and results to txt files in the current directory:
 "Whiteboards-*.txt" contains the incremental results containing whiteboards in JSON for the tenant where * is the provided IncrementalRunName
 "WhiteboardAdminRun-*.txt" contains the state of the current where * is the provided IncrementalRunName. This file should not be modified manually

.PARAMETER ForceAuthPrompt
(Optional) Always prompt for auth. Use to ignore cached credentials.

.EXAMPLE
Get-WhiteboardsForTenant -Geography Europe
Gets all the whiteboards associated with the caller's tenant in Europe

.EXAMPLE
Get-WhiteboardsForTenant -Geography Europe -IncrementalRunName 1
Gets all the tenant whiteboards in Europe and incrementally writes them to Whiteboards-1.txt file in the current directory. 
Saves progress at WhiteboardAdminRun-1.txt file until the request is completed. If this file already exists, continues the progress using the last saved token.
#>
function Get-WhiteboardsForTenant
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet('Worldwide', 'Europe', 'Australia')]
        [string]$Geography,

        [Parameter(Mandatory=$false)]
        [string]$IncrementalRunName,

        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt)

    # helper function for calling the Get-WhiteboardOwners API wrapped in a retry
    function Get-WhiteboardOwnersWithRetry(
        [Parameter(Mandatory=$true)]
        [string]$Geography,
        [Parameter(Mandatory=$false)]
        [string]$ContinuationToken,  
        [Parameter(Mandatory=$true)]
        [object]$AuthenticationToken) {
        
        $Headers =  @{ "Authorization" = Get-WhiteboardAuthenticationHeader -AuthenticationToken $AuthenticationToken }
        $retryCount = 0
        while ($true) {
            try {
                $results = Send-GetWhiteboardOwnersRequest `
                -Geography $Geography `
                -ContinuationToken $ContinuationToken `
                -Headers $Headers
                
                return $results
            } catch {
                Write-Verbose "Failed to get owners. Retry count: $retryCount"
                $retryCount++
                if ($retryCount -gt 4) {
                    throw $_.Exception
                }
            }
        }
    }

    # helper function for calling the Get-Whiteboard API for a user wrapped in a retry and filtering for
    # a specific geography.
    function Get-WhiteboardsInGeographyForUser(
        [Parameter(Mandatory=$true)]
        [string]$OwnerId, 
        [Parameter(Mandatory=$true)]
        [string]$Geography,
        [Parameter(Mandatory=$true)]
        [object]$AuthenticationToken) {

        $retryCount = 0
        $baseApi = ""
        if ($Geography -eq 'Worldwide') {
            $baseApi = "us*"
        }
        elseif ($Geography -eq 'Europe') {
            $baseApi = "eu*"
        }
        elseif ($geography -eq 'Australia') {
            $baseApi = "au*"
        }

        $Headers =  @{ "Authorization" = Get-WhiteboardAuthenticationHeader -AuthenticationToken $AuthenticationToken }
        while ($true) {
            try {            
                $response = Send-GetWhiteboardsRequest -UserId $ownerId -Headers $Headers | Where-Object -Property baseApi -like $baseApi
                # Filter out items that do not have fluidFileId
                return $response | Where-Object {-not $_.fluidFileId}
            } catch {
                Write-Verbose "Failed to get whiteboards for $ownerId. Retry count: $retryCount"
                $retryCount++
                if ($retryCount -gt 4) {
                    throw $_.Exception
                }
            }
        }
    }

    # A helper function to set up files for incremental results between runs. Allows for continuing from a previously cancelled run
    function Set-WhiteboardsIncrementalRun(
        [Parameter(Mandatory=$true)]
        [string]$ContinuationTokenFileName, 
        [Parameter(Mandatory=$true)]
        [string]$WhiteboardResultsFileName) {

        if(Test-Path -Path $ContinuationTokenFileName)
        {
            $existingContinuationToken = Get-Content -Path $ContinuationTokenFileName
            if(-not [string]::IsNullOrEmpty($existingContinuationToken))
            {
                Write-Host "Previous run detected. Continuing get-whiteboard enumeration`n"
                return $existingContinuationToken
            }
            else 
            {
                Write-Warning "$ContinuationTokenFileName is corrupted. Whiteboard enumeration will start from the beginning.`n"
            }
        }

        New-Item -Name $WhiteboardResultsFileName -ItemType "file" -Force | Out-Null
        Write-Host "Starting new get-whiteboard enumeration and clearing any previous run data`n"
        Write-Host "Whiteboards will be added to $WhiteboardResultsFileName in the current directory`n"
        Write-Host "The run state will be written to $ContinuationTokenFileName. This file does not contain readable data, but necessary for incremental results. To resume a previous cmdlet call, make the same call with the same parameters`n"
        return $null
    }

    $continuationToken = $null

    # Set up files to write the results for incremental runs. Allows for continuing from a previously cancelled run
    $incrementalResults = -not [string]::IsNullOrEmpty($IncrementalRunName)
    $continuationTokenFileName = "WhiteboardAdminRun-$IncrementalRunName.txt"
    $whiteboardResultsFileName = "Whiteboards-$IncrementalRunName.txt"
    if($incrementalResults)
    {
        $continuationToken = Set-WhiteboardsIncrementalRun -ContinuationTokenFileName $continuationTokenFileName -WhiteboardResultsFileName $whiteboardResultsFileName
    }
    
    $whiteboardsAll = @()   
    $AuthenticationToken = Get-WhiteboardAuthenticationToken -ForceAuthPrompt:$ForceAuthPrompt

    do
    {
        Write-Verbose "Getting page of owners`n"
        $AuthenticationToken = Update-WhiteboardAuthenticationToken -AuthenticationToken $AuthenticationToken
        $results = Get-WhiteboardOwnersWithRetry -Geography $Geography -ContinuationToken $continuationToken -AuthenticationToken $AuthenticationToken
        $count = $results.items.Count
        Write-Verbose "Found $count whiteboard owners in $Geography"
        $continuationToken = $results.continuationToken
        if(-not [string]::IsNullOrEmpty($continuationToken)){
            Write-Verbose "More whiteboard owners exist"
        }
        foreach($ownerId in $results.items)
        {
            Write-Verbose "Adding boards for owner $ownerId`n"
            $AuthenticationToken = Update-WhiteboardAuthenticationToken -AuthenticationToken $AuthenticationToken
            $whiteboards = Get-WhiteboardsInGeographyForUser -OwnerId $ownerId -Geography $Geography -AuthenticationToken $AuthenticationToken
            $wbCount = $whiteboards.Count
            Write-Verbose "User $ownerId has $wbCount whiteboards in $Geography"
            if($incrementalResults)
            { 
                foreach($whiteboard in $whiteboards)
                {
                    Add-Content -Path $whiteboardResultsFileName -Value (ConvertTo-Json $whiteboard -Compress -Depth 1)
                    Write-Verbose "$ownerId's whiteboards appended to file  $whiteboardResultsFileName"
                }
            }
            else
            {
                $whiteboardsAll = $whiteboardsAll + $whiteboards
            }
        }

        # Store the continuation token
        if($incrementalResults)
        {
            $continuationToken | Out-File $continuationTokenFileName
            Write-Verbose "Wrote continuation token to file $continuationTokenFileName"
        }
    }
    while(-not [string]::IsNullOrEmpty($continuationToken))

    if($incrementalResults)
    {
        Remove-Item $continuationTokenFileName
        Write-Verbose "Removed continuation token file $continuationTokenFileName"
        Write-Host "Completed Get-WhiteboardsForTenant. Results stored in $whiteboardResultsFileName"
        return
    } 
    else
    {
        return $whiteboardsAll
    }
}

function Get-WhiteboardsForTenantMigrated
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false)]
        [string]$IncrementalRunName,

        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt)

    try{
        Connect-MgGraph -Scopes "User.Read.All", "Files.Read.All", "Sites.Read.All", "Sites.ReadWrite.All"
        # Get all users in the tenant
        $users = Get-MgUser -All -ResponseHeadersVariable headers -ErrorAction Stop | Select-Object -ExpandProperty Id
        $requestId = $headers['request-id']
	    $clientRequestId = $headers['client-request-id']
        $userIds_count = $users | Measure-Object | Select-Object -ExpandProperty Count
        Write-Verbose "Successfully fetched total $userIds_count user accounts."
        Write-Verbose "Users are: $users"
    } catch {
        Write-Host "Failed to fetch user accounts with REQUEST ID: $requestId  CLIENT REQUEST ID: $clientRequestId."
    }

    $incrementalResults = -not [string]::IsNullOrEmpty($IncrementalRunName)
    if($incrementalResults) {
        $whiteboardResultsFileName = "WhiteboardsMigrated-$IncrementalRunName.txt"
        if (Test-Path -Path $whiteboardResultsFileName) {
            Clear-Content -Path $whiteboardResultsFileName
        }
    }

    foreach ($user in $users) {
        Get-WhiteboardsMigrated -UserId $user -ForceAuthPrompt:$ForceAuthPrompt -ConnectMgGraph 'NotRequired' -IncrementalRunName $IncrementalRunName
    }
}

<#
.SYNOPSIS
Restores the specified Whiteboard by removing the mapping to the board migrated to ODB. This will not delete the ODB board.
Restoration is only possible for approximately 30 days after migration, when the original board is still available.
.PARAMETER WhiteboardId
The ID of a specific Whiteboard to be restored.
.PARAMETER ForceAuthPrompt
(Optional) Always prompt for auth. Use to ignore cached credentials.
.EXAMPLE
Restore-Whiteboard -WhiteboardId 00000000-0000-0000-0000-000000000000
#>
function Restore-Whiteboard
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [Guid]$WhiteboardId,

        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt)
        
    if ($PSCmdlet.ShouldProcess("Restore whiteboard $WhiteboardId?"))
    {
        Invoke-WhiteboardRequest `
            -Method DELETE `
            -Endpoint "api/v1.0/admin/whiteboards/$WhiteboardId/fluidFileInfo" `
            -ContentType 'application/json' `
            -ForceAuthPrompt:$ForceAuthPrompt
    }
}

<#
.SYNOPSIS
Gets all Azure whiteboards for a user and maps them with their migrated Fluid boards in SharePoint OneDrive.

.PARAMETER UserId
The ID of the user account to query whiteboards for.

.PARAMETER IncrementalRunName
(Optional) Saves incremental progress as the cmdlet runs. Use to resume a partially completed mapping operation.
Use the same IncrementalRunName on later calls to continue a previously cancelled/failed run.
Writes progress and results to JSON files in the current directory:
 "WhiteboardMappings-*.json" contains the incremental mapping results where * is the provided IncrementalRunName

.PARAMETER ForceAuthPrompt
(Optional) Always prompt for auth. Use to ignore cached credentials.

.EXAMPLE
Get-WhiteboardMigrationMapping -UserId 00000000-0000-0000-0000-000000000001
Gets all Azure whiteboards and migrated Fluid boards for the user and returns a mapping between them.

.EXAMPLE
Get-WhiteboardMigrationMapping -UserId 00000000-0000-0000-0000-000000000001 -IncrementalRunName run1
Gets mapping and saves incremental progress to WhiteboardMappings-run1.json file in the current directory.
#>
function Get-WhiteboardMigrationMapping
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [Guid]$UserId,

        [Parameter(Mandatory=$false)]
        [string]$IncrementalRunName,

        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt)

    # Helper function to get Azure whiteboards with retry logic and pagination
    function Get-AzureWhiteboardsWithRetry(
        [Parameter(Mandatory=$true)]
        [Guid]$UserId,
        [Parameter(Mandatory=$false)]
        [hashtable]$Headers,
        [Parameter(Mandatory=$false)]
        [switch]$ForceAuthPrompt) {
        
        $retryCount = 0
        $allWhiteboards = @()
        
        while ($true) {
            try {
                Write-Verbose "Fetching Azure whiteboards for user $UserId (retry: $retryCount)"
                $response = Send-GetWhiteboardsRequest -UserId $UserId -Headers $Headers -ForceAuthPrompt:$ForceAuthPrompt
                
                if ($response) {
                    $allWhiteboards += $response
                }
                
                # Note: Current API doesn't support pagination, but this structure allows for future enhancement
                return $allWhiteboards
            } catch {
                Write-Verbose "Failed to get Azure whiteboards. Retry count: $retryCount"
                $retryCount++
                if ($retryCount -gt 1) {
                    throw $_.Exception
                }
                Start-Sleep -Seconds ([Math]::Pow(2, $retryCount))
            }
        }
    }

    # Helper function to get migrated whiteboards from OneDrive with pagination
    function Get-AllMigratedWhiteboards(
        [Parameter(Mandatory=$true)]
        [string]$DriveId,
        [Parameter(Mandatory=$true)]
        [Guid]$UserId) {
        
        $allItems = @()
        $Uri = "https://graph.microsoft.com/v1.0/drives/$DriveId/root:/Whiteboards/Migration:/children"
        $retryCount = 0
        
        while ($Uri) {
            try {
                Write-Verbose "Fetching migrated whiteboards from drive $DriveId (page)"
                $driveItems = Invoke-MgGraphRequest -Method GET -Uri $Uri
                
                if ($driveItems -and $driveItems.value) {
                    # Add DriveId property to each item for matching
                    foreach ($item in $driveItems.value) {
                        $item | Add-Member -NotePropertyName 'parentDriveId' -NotePropertyValue $DriveId -Force
                        $allItems += $item
                    }
                    
                    $itemCount = ($driveItems.value | Measure-Object).Count
                    Write-Verbose "Retrieved $itemCount items from drive $DriveId"
                }
                
                # Check for next page
                $Uri = $driveItems.'@odata.nextLink'
                $retryCount = 0  # Reset retry count on successful page
                
            } catch {
                $message = "Failed to get migrated whiteboards for user $UserId from drive $DriveId."
                $requestIds = ExtractRequestIdsFromError
                $requestId = $requestIds.RequestId
                $clientRequestId = $requestIds.ClientRequestId
                if ($requestId -or $clientRequestId) {
                    $message += " REQUEST ID: $requestId  CLIENT REQUEST ID: $clientRequestId"
                }
                Write-Warning $message

                $retryCount++
                if ($retryCount -gt 1) {
                    Write-Warning "Failed to retrieve items from drive $DriveId after $retryCount retries."
                    break
                }
                Start-Sleep -Seconds ([Math]::Pow(2, $retryCount))
            }
        }
        
        return $allItems
    }

    # Helper function to create mapping object
    function New-WhiteboardMapping(
        [Parameter(Mandatory=$false)]
        [AllowNull()]
        [object]$AzureBoard,
        [Parameter(Mandatory=$false)]
        [AllowNull()]
        [object]$MigratedBoard) {

        $mapping = [PSCustomObject]@{
            AzureWhiteboardId = $null
            AzureWhiteboardTitle = $null
            AzureWhiteboardOwnerId = $null
            AzureWhiteboardCreatedTime = $null
            AzureWhiteboardBaseApi = $null
            FluidFileId = $null
            MigratedBoardDriveId = $null
            MigratedBoardItemId = $null
            MigratedBoardName = $null
            MigratedBoardSize = $null
            MigratedBoardLastModified = $null
            MigratedBoardCreated = $null
            MappingStatus = $null
        }
        
        # Populate Azure board properties
        if ($null -ne $AzureBoard) {
            $mapping.AzureWhiteboardId = $AzureBoard.id
            $mapping.AzureWhiteboardTitle = $AzureBoard.title
            $mapping.AzureWhiteboardOwnerId = $AzureBoard.ownerId
            $mapping.AzureWhiteboardCreatedTime = $AzureBoard.createdTime
            $mapping.AzureWhiteboardBaseApi = $AzureBoard.baseApi
            $mapping.FluidFileId = $AzureBoard.fluidFileId
        }

        # Populate migrated board properties
        if ($null -ne $MigratedBoard) {
            $mapping.MigratedBoardDriveId = $MigratedBoard.parentDriveId
            $mapping.MigratedBoardItemId = $MigratedBoard.id
            $mapping.MigratedBoardName = $MigratedBoard.name
            $mapping.MigratedBoardSize = $MigratedBoard.size
            $mapping.MigratedBoardLastModified = $MigratedBoard.lastModifiedDateTime
            $mapping.MigratedBoardCreated = $MigratedBoard.createdDateTime
        }

        # Determine mapping status based on what was provided
        $mapping.MappingStatus = if ($null -ne $AzureBoard -and $null -ne $MigratedBoard) {
            "Fully Mapped"
        } elseif ($null -ne $AzureBoard) {
            "Migrated board not found"
        } elseif ($null -ne $MigratedBoard) {
            "Azure board not found"
        } else {
            "No data provided"
        }

        return $mapping
    }

    # Helper function to set up incremental run file
    function Initialize-IncrementalRun(
        [Parameter(Mandatory=$true)]
        [string]$MappingResultsFileName) {

        if (Test-Path -Path $MappingResultsFileName) {
            Write-Host "Previous mapping file detected. Appending new results to $MappingResultsFileName`n"
        } else {
            New-Item -Name $MappingResultsFileName -ItemType "file" -Force | Out-Null
            Write-Host "Starting new mapping operation`n"
            Write-Host "Mappings will be saved to $MappingResultsFileName in the current directory`n"
        }
    }

    # Main function logic starts here
    $incrementalResults = -not [string]::IsNullOrEmpty($IncrementalRunName)
    $mappingResultsFileName = "WhiteboardMappings-$IncrementalRunName.json"
    
    if ($incrementalResults) {
        Initialize-IncrementalRun -MappingResultsFileName $mappingResultsFileName
    }

    # Connect to Microsoft Graph for OneDrive access
    try {
        Connect-MgGraph -Scopes "User.Read.All", "Files.Read.All", "Sites.Read.All", "Sites.ReadWrite.All" -ErrorAction Stop
        Write-Host "Successfully connected to Microsoft Graph"
    } catch {
        Write-Error "Failed to connect to Microsoft Graph: $_"
        return $null
    }

    # Get all Azure whiteboards for the user (including those with fluidFileId for mapping)
    Write-Host "Getting all whiteboards for user $UserId"
    try {
        $allWhiteboards = Get-AzureWhiteboardsWithRetry -UserId $UserId -ForceAuthPrompt:$ForceAuthPrompt
    } catch {
        Write-Warning "Failed to get whiteboards for user $UserId : $_"
        return $null
    }

    # Filter whiteboards with fluidFileId (migrated boards)
    $whiteboardsWithFluidInfo = @($allWhiteboards | Where-Object { $_.fluidFileId })
    
    if ($whiteboardsWithFluidInfo.Count -gt 0) {
        $mappedCount = ($whiteboardsWithFluidInfo | Measure-Object).Count
        Write-Host "Found $mappedCount old whiteboards"
    } else {
        Write-Host "No migrated whiteboards found for user $UserId. Continuing to check for migrated-only boards."
    }

    # Get all migrated Fluid whiteboards from SharePoint OneDrive with pagination
    Write-Host "Getting new migrated whiteboards from OneDrive for user $UserId"
    try {
        $Drives = Get-MgUserDrive -UserId $UserId -ErrorAction Stop | Select-Object -ExpandProperty Id
        Write-Host "DriveIds for user $UserId : $Drives"
    } catch {
        $message = "Failed to get OneDrive for user $UserId : $_"
        $requestIds = ExtractRequestIdsFromError
        $requestId = $requestIds.RequestId
        $clientRequestId = $requestIds.ClientRequestId
        if ($requestId -or $clientRequestId) {
            $message += " REQUEST ID: $requestId  CLIENT REQUEST ID: $clientRequestId"
        }
        Write-Warning $message
        $Drives = $null
    }

    $migratedWhiteboards = @()
    if ($Drives) {
        foreach ($DriveId in $Drives) {
            try {
                $driveItems = Get-AllMigratedWhiteboards -DriveId $DriveId -UserId $UserId
                if ($driveItems) {
                    $migratedWhiteboards += $driveItems
                    $driveCount = ($driveItems | Measure-Object).Count
                    Write-Host "Found $driveCount migrated whiteboards in drive $DriveId for user $UserId"
                }
            } catch {
                Write-Host "No migrated whiteboards found in drive $DriveId for user $UserId"
            }
        }
    }

    # Create mappings between Azure and migrated whiteboards (full outer join)
    $mappings = @()
    # Lookup dictionary for migrated whiteboards
    $migratedLookup = @{}
    # Track matched migrated keys to find migrated-only boards later
    $matchedMigratedKeys = [System.Collections.Generic.HashSet[string]]::new()
    $migratedWhiteboards = @($migratedWhiteboards)

    # Build lookup dictionary for migrated whiteboards
    foreach ($migrated in $migratedWhiteboards) {
        $lookupKey = "{0}|{1}" -f $migrated.parentDriveId, $migrated.id
        if (-not $migratedLookup.ContainsKey($lookupKey)) {
            $migratedLookup[$lookupKey] = $migrated
        }
    }
    
    # Map Azure whiteboards with fluidFileId to migrated whiteboards 
    foreach ($mappedBoard in $whiteboardsWithFluidInfo) {
        $matchedMigrated = $null
        $matchKey = $null

        if ($mappedBoard.fluidFileId) {
            # Parse fluidFileId to extract DriveId and ItemId
            $fluidParts = $mappedBoard.fluidFileId -split '/'
            if ($fluidParts.Count -eq 3) {
                $expectedDriveId = $fluidParts[1]
                $expectedItemId = $fluidParts[2]
                if ($expectedDriveId -and $expectedItemId) {
                    # Matching key format: "DriveId|ItemId"
                    $matchKey = "$expectedDriveId|$expectedItemId"
                    if ($migratedLookup.ContainsKey($matchKey)) {
                        $matchedMigrated = $migratedLookup[$matchKey]
                        $null = $matchedMigratedKeys.Add($matchKey)
                    }
                }
            }
        }

        $mapping = New-WhiteboardMapping -AzureBoard $mappedBoard -MigratedBoard $matchedMigrated
        $mappings += $mapping
    }

    # Find migrated-only whiteboards (no matching Azure board) and add them to mappings
    foreach ($migratedOnly in $migratedWhiteboards) {
        $migratedKey = "{0}|{1}" -f $migratedOnly.parentDriveId, $migratedOnly.id
        if (-not $matchedMigratedKeys.Contains($migratedKey)) {         
            $mapping = New-WhiteboardMapping -AzureBoard $null -MigratedBoard $migratedOnly
            $mappings += $mapping
        }
    }

    if ($incrementalResults) {
        Add-Content -Path $mappingResultsFileName -Value (ConvertTo-Json $mappings -Compress -Depth 5)
        Write-Host "Mapping results saved to $mappingResultsFileName"
        return
    } else {
        return $mappings
    }
}

function Invoke-WhiteboardRequest(
    [Parameter(Mandatory=$true)]
    [Microsoft.PowerShell.Commands.WebRequestMethod]$Method,

    [Parameter(Mandatory=$true)]
    [string]$Endpoint,

    [Parameter(Mandatory=$false)]
    [string]$ContentType = $null,

    [Parameter(Mandatory=$false)]
    [string]$Body = $null,

    [Parameter(Mandatory=$false)]
    [hashtable]$Headers = $null,
    
    [Parameter(Mandatory=$false)]
    [switch]$ForceAuthPrompt,
    
    [Parameter(Mandatory=$false)]
    [string]$WhiteboardRequestType = $null)
{
    # Make sure TLS 1.2 is a supported protocol since this is all the whiteboard service supports.
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol, [Net.SecurityProtocolType]::Tls12
    
    if (!$Headers.Count){
        $Headers =  @{}
    }
    if(!$Headers.ContainsKey('Authorization')) {
        $Headers['Authorization'] = Get-WhiteboardAuthenticationHeader -ForceAuthPrompt:$ForceAuthPrompt
    }
    if ($WhiteboardRequestType -eq 'oneDriveMigration') {
        $Uri = $Endpoint
    } else {
        $Uri = "https://$(Get-WhiteboardHostName -Environment $env:Environment)/$Endpoint"
    }


    $invokeRestMethodArgs = @{
        Method = $Method
        Uri = $Uri
        ContentType = $ContentType
        UserAgent = "WhiteboardAdminModule/$((Get-Module WhiteboardAdmin | Select-Object -First 1).Version)"
        Headers = $Headers
    }

    if (-Not [string]::IsNullOrEmpty($Body))
    {
        $invokeRestMethodArgs["Body"] = $Body
    }

    try
    {
        return Invoke-RestMethod @invokeRestMethodArgs
    }
    catch [System.Net.WebException]
    {
        $ex = $_.Exception
        if ($ex.Status -ne [System.Net.WebExceptionStatus]::ProtocolError)
        {
            # Rethrow the exception if the failure wasn't caused by a protocol error.
            throw $ex
        }

        $response = $ex.Response
        if ($response.StatusCode -ne [System.Net.HttpStatusCode]::Unauthorized)
        {
            # Rethrow the exception if the failure wasn't caused by a unauthorized response
            throw $ex
        }

        # Try to deserialize the adal claims challenge.
        # This can happen if the endpoint makes an onbehalf
        # of request that requires additional claims (like MFA)
        try
        {
            $authenticateHeader = $response.Headers["WWW-Authenticate"]
            $claims = Get-ClaimsFromWWWAuthenticateHeader($authenticateHeader)
            if ([string]::IsNullOrEmpty($claims))
            {
                throw $ex
            }
        }
        catch
        {
            throw $ex
        }

        $invokeRestMethodArgs['Headers']['Authorization'] = Get-WhiteboardAuthenticationHeader -Claims $claims -ForceAuthPrompt:$ForceAuthPrompt

        return Invoke-RestMethod @invokeRestMethodArgs
    }
}

function Get-WhiteboardAuthenticationHeader(
    [Parameter(Mandatory=$false)]
    [string]$Claims,

    [Parameter(Mandatory=$false)]
    [object]$AuthenticationToken,

    [Parameter(Mandatory=$false)]
    [switch]$ForceAuthPrompt)
{
    if(!$AuthenticationToken)
    {
        $AuthenticationToken = Get-WhiteboardAuthenticationToken -Claims $claims -ForceAuthPrompt:$ForceAuthPrompt  
    }

    return $AuthenticationToken.CreateAuthorizationHeader()
}

function Update-WhiteboardAuthenticationToken(
    [Parameter(Mandatory=$true)]
    [object]$AuthenticationToken)
{
    $DateTime = (Get-Date).ToUniversalTime()
    $TokenExpires = ($AuthenticationToken.ExpiresOn.datetime - $DateTime).TotalMinutes

    # update auth token if it is close to expiry, so we have enough time to make requests
    if ($TokenExpires -le 5) {

        Write-Verbose ("Authentication Token expires in less than $TokenExpires minutes")
        $AuthenticationToken = Get-WhiteboardAuthenticationToken
    }

    return $AuthenticationToken
}

function Get-WhiteboardAuthenticationToken(
    [Parameter(Mandatory=$false)]
    [string]$Claims,

    [Parameter(Mandatory=$false)]
    [switch]$ForceAuthPrompt)
{
    Write-Verbose "Getting authentication token for user"
    $whiteboardResourceId = Get-WhiteboardResourceId -Environment $env:Environment
    $aadAuthority = Get-AadAuthority -Environment $env:Environment
    [String[]]$capabilities = @("cp1")
    if (-not $PublicClient) 
    { 
        Write-Verbose "Creating new PublicClient"
        $script:PublicClient = [Microsoft.Identity.Client.PublicClientApplicationBuilder]::Create($AdalClientId).WithAuthority($aadAuthority).WithClientCapabilities($capabilities).Build();
    }
    $promptBehavior = if ($ForceAuthPrompt -eq $true) { [Microsoft.Identity.Client.Prompt]::ForceLogin } else { [Microsoft.Identity.Client.Prompt]::NoPrompt }

    [String[]]$scopes = @( $whiteboardResourceId + "/Whiteboards.ReadWrite" );
  
    if (-not $ForceAuthPrompt)
    {
        Write-Verbose "try silent: { hint used: $UserAccount}"
        $request = $PublicClient.AcquireTokenSilent($scopes, $UserAccount);
    }
    else
    {
        Write-Verbose "force auth"
        $request = $PublicClient.AcquireTokenInteractive($scopes).WithPrompt($promptBehavior);
    }

    if (-Not ([string]::IsNullOrEmpty($Claims)))
    {
        $request = $request.WithClaims($Claims);
    }

    try
    {
        $result = $request.ExecuteAsync().GetAwaiter().GetResult();
    }  
    catch [Microsoft.Identity.Client.MsalUiRequiredException]
    {
        Write-Verbose "failed silent get, retrying interactive"
        $request = $PublicClient.AcquireTokenInteractive($scopes).WithPrompt($promptBehavior)
        if (-Not ([string]::IsNullOrEmpty($Claims)))
        {
            $request = $request.WithClaims($Claims);
        }
        $result = $request.ExecuteAsync().GetAwaiter().GetResult();
    }

    $script:UserAccount = $result.Account.Username
    Write-Verbose "{ account saved: $UserAccount}"

    return $result;
}

function Get-ClaimsFromWWWAuthenticateHeader(
    [Parameter(Mandatory=$true)]
    [string]$header
)
{
    if (!$header -or !$header.StartsWith("Bearer "))
    {
        return $null;
    }

    $params = $header.Substring("Bearer ".length).split(@(","))

    $claimsParam = $params | Where-Object {$_.TrimStart().StartsWith('claims')}

    if (!$claimsParam -or $claimsParam.IndexOf("=") -eq -1)
    {
        return $null;
    }

    $encodedClaims = $claimsParam.Substring($claimsParam.IndexOf("=") + 1).Trim('"')

    return [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($encodedClaims))
}

function Get-WhiteboardHostName(
    [Parameter(Mandatory=$false)]
    [ValidateSet('Prod', 'Int', 'Dev', '')]
    [string] $Environment)
{
    switch ($Environment)
    {
        'Dev'   { return "dev.whiteboard.microsoft.com"}
        'Int'   { return "int.whiteboard.microsoft.com"}
        'Graph'   { return "graph.microsoft.com"}
        default { return  "whiteboard.microsoft.com" }
    }
}

function Get-WhiteboardResourceId(
    [Parameter(Mandatory=$false)]
    [ValidateSet('Prod', 'Int', 'Dev', '', 'Graph')]
    [string] $Environment)
{
    switch ($Environment)
    {
        'Int'   { return "https://int.whiteboard.microsoft.com"}
        'Graph'   { return "https://graph.microsoft.com"}
        default { return  "https://whiteboard.microsoft.com" }
    }
}

function Get-AadAuthority(
    [Parameter(Mandatory=$false)]
    [ValidateSet('Prod', 'Int', 'Dev', '')]
    [string] $Environment)
{
    switch ($Environment)
    {
        'Int'   { return "https://login.windows-ppe.net/common/v2.0"}
        default { return "https://login.microsoftonline.com/common/v2.0" }
    }
}