#
# Copyright (c) Microsoft Corporation.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
# This PS DSC resource enables register or unregister a package source through DSC Get, Set and Test operations on DSC managed nodes.

Import-LocalizedData -BindingVariable LocalizedData -filename MSFT_PackageManagementSource.strings.psd1

Import-Module -Name "$PSScriptRoot\..\PackageManagementDscUtilities.psm1"

function Get-TargetResource
{
    <#
    .SYNOPSIS

    This DSC resource provides a mechanism to register/unregister a package source on your computer. 

    Get-TargetResource returns the current state of the resource.

    .PARAMETER Name
    Specifies the name of the package source to be registered or unregistered on your system.

    .PARAMETER ProviderName
    Specifies the name of the PackageManagement provider through which you can interop with the package source.

    .PARAMETER SourceLocation
    Specifies the Uri of the package source.
    #>

    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String]
        $ProviderName,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourceLocation
    )

    #initialize a local var
    $ensure = "Absent"

    #Set the installation policy by default, untrusted. 
    $installationPolicy ="Untrusted"

    $PSBoundParameters.Add("Location", $SourceLocation)
    $PSBoundParameters.Remove("SourceLocation")

    #Validate Uri and add Location because PackageManagement uses Location not SourceLocation. 
    #ValidateArgument  -Argument $PSBoundParameters['Location'] -Type 'PackageSource' -ProviderName $ProviderName

    Write-Verbose -Message ($localizedData.StartGetPackageSource -f $($Name))

    #check if the package source already registered on the computer
    # Note: Assume Get-PackageSource returns the first source if multiple are found
    $source = PackageManagement\Get-PackageSource @PSBoundParameters -ForceBootstrap -ErrorAction SilentlyContinue -WarningAction SilentlyContinue  
        

    if (($source.count -gt 0) -and ($source.IsRegistered))
    {
        Write-Verbose -Message ($localizedData.PackageSourceFound -f $($Name))
        $ensure = "Present"
    }
    else
    {
        Write-Verbose -Message ($localizedData.PackageSourceNotFound -f $($Name))
    }

    Write-Debug -Message "Source $($Name) is $($ensure)"
                         
    
    if ($ensure -eq 'Absent')
    {
        return @{
            Ensure       = $ensure
            Name         = $Name
            ProviderName = $ProviderName
        }
    }
    else
    {
        if ($source.IsTrusted)
        {
            $installationPolicy = "Trusted"
        }

        return @{
            Ensure             = $ensure
            Name               = $Name
            ProviderName       = $ProviderName
            SourceLocation          = $source.Location
            InstallationPolicy = $installationPolicy
        }
    } 
}

function Test-TargetResource
{
    <#
    .SYNOPSIS

    This DSC resource provides a mechanism to register/unregister a package source on your computer. 

    Test-TargetResource validates whether the resource is currently in the desired state.

    .PARAMETER Name
    Specifies the name of the package source to be registered or unregistered on your system.

    .PARAMETER ProviderName
    Specifies the name of the PackageManagement provider through which you can interop with the package source.

    .PARAMETER SourceLocation
    Specifies the Uri of the package source.

    .PARAMETER Ensure
    Determines whether the package source to be registered or unregistered.

    .PARAMETER SourceCredential
    Provides access to the package on a remote source. 

    .PARAMETER InstallationPolicy
    Determines whether you trust the package’s source.
    #>

    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String]
        $ProviderName,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourceLocation,

        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure="Present",

        [System.Management.Automation.PSCredential]
        $SourceCredential,

        [ValidateSet("Trusted","Untrusted")]
        [System.String]
        $InstallationPolicy="Untrusted"
    )

    #Get the current status of the package source 
    Write-Debug -Message  "Calling Get-TargetResource"

    $status = Get-TargetResource -Name $Name -ProviderName $ProviderName -SourceLocation $SourceLocation
 
    if($status.Ensure -eq $Ensure)
    {
        
        if ($status.Ensure -eq "Present") 
        {
            #Check if the source location matches. As get-package takes location (SourceLocation) parameter, the result from Get-package should 
            #belong to the particular source location. But currently it does not. Below is the workaround.
            #
            if ($status.SourceLocation -ine $SourceLocation) 
            {
                Write-Verbose -Message ($localizedData.NotInDesiredStateDuetoLocationMismatch -f $($Name), $($SourceLocation), $($status.SourceLocation))
                return $false 
            }  

            #Check if the installationPolicy matches. Sometimes the registered source and desired source can be the same except for InstallationPolicy
            #
            if ($status.InstallationPolicy -ine $InstallationPolicy)
            {
                Write-Verbose -Message ($localizedData.NotInDesiredStateDuetoPolicyMismatch -f $($Name), $($InstallationPolicy), $($status.InstallationPolicy))
                return $false 
            }           
        }

        Write-Verbose -Message ($localizedData.InDesiredState -f $($Name), $($Ensure), $($status.Ensure))                   
        return $true
    }
    else
    {
        Write-Verbose -Message ($localizedData.NotInDesiredState -f $($Name), $($Ensure), $($status.Ensure))
        return $false
    }
}

function Set-TargetResource
{
    <#
    .SYNOPSIS

    This DSC resource provides a mechanism to register/unregister a package source on your computer. 

    Set-TargetResource sets the resource to the desired state. "Make it so".

    .PARAMETER Name
    Specifies the name of the package source to be registered or unregistered on your system.

    .PARAMETER ProviderName
    Specifies the name of the PackageManagement provider through which you can interop with the package source.

    .PARAMETER SourceLocation
    Specifies the Uri of the package source.

    .PARAMETER Ensure
    Determines whether the package source to be registered or unregistered.

    .PARAMETER SourceCredential
    Provides access to the package on a remote source. 

    .PARAMETER InstallationPolicy
    Determines whether you trust the package’s source.
    #>

    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String]
        $ProviderName,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourceLocation,

        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure="Present",

        [System.Management.Automation.PSCredential]
        $SourceCredential,

        [ValidateSet("Trusted","Untrusted")]
        [System.String]
        $InstallationPolicy="Untrusted"
    )

    #Add Location because PackageManagement uses Location not SourceLocation. 
    $PSBoundParameters.Add("Location", $SourceLocation)

    if ($PSBoundParameters.ContainsKey("SourceCredential"))
    {
        $PSBoundParameters.Add("Credential", $SourceCredential)
    }

    if ($InstallationPolicy -ieq "Trusted")
    {
        $PSBoundParameters.Add("Trusted", $True)
    }
    else
    {
        $PSBoundParameters.Add("Trusted", $False)
    }
    

    if($Ensure -ieq "Present")
    {   
        #
        #Warn a user about the installation policy
        #
        Write-Warning -Message ($localizedData.InstallationPolicyWarning -f $($Name), $($SourceLocation), $($InstallationPolicy))

        $extractedArguments = ExtractArguments -FunctionBoundParameters $PSBoundParameters `
                                               -ArgumentNames ("Name","ProviderName", "Location", "Credential", "Trusted")   
        
        Write-Verbose -Message ($localizedData.StartRegisterPackageSource -f $($Name)) 

        if ($name -eq "psgallery")
        {         
            # In WMF 5.0 RTM, we are not able to register 'psgallery' package source. Thus let's try Set-PSRepository to see if we can
            # update the registration. 
            
            # Before calling the Set-PSRepository cmdlet, we need to make sure the PSGallery already registered.

            $psgallery = PackageManagement\Get-PackageSource -name $name -Location $SourceLocation -ProviderName $ProviderName -ErrorAction SilentlyContinue -WarningAction SilentlyContinue

            if( $psgallery)
            {
                Set-PSRepository -Name $name -SourceLocation $SourceLocation -InstallationPolicy $InstallationPolicy -ErrorVariable ev 
            }
            else
            {
                # The following works if you are running TP5 or later
                $extractedArguments.Remove("Location")
                PackageManagement\Register-PackageSource @extractedArguments -Force -ErrorVariable ev  

            }
        }
        else
        {                                       
            PackageManagement\Register-PackageSource @extractedArguments -Force -ErrorVariable ev  
        }
            
        if($null -ne $ev -and $ev.Count -gt 0)
        {
            ThrowError  -ExceptionName "System.InvalidOperationException" `
                        -ExceptionMessage ($localizedData.RegisterFailed -f $Name, $ev.Exception)`
                        -ErrorId "RegisterFailed" `
                        -ErrorCategory InvalidOperation                  
        }
        else
        {
            Write-Verbose -Message ($localizedData.RegisteredSuccess -f $($Name))           
        }                      
    }
    #Ensure=Absent
    else 
    {
        $extractedArguments = ExtractArguments -FunctionBoundParameters $PSBoundParameters `
                                               -ArgumentNames $("Name","ProviderName", "Location", "Credential")  
                                                       
        Write-Verbose -Message ($localizedData.StartUnRegisterPackageSource -f $($Name))  
                         
        PackageManagement\Unregister-PackageSource @extractedArguments -Force -ErrorVariable ev 
        
        if($null -ne $ev -and $ev.Count -gt 0)
        {
            ThrowError  -ExceptionName "System.InvalidOperationException" `
                        -ExceptionMessage ($localizedData.UnRegisterFailed -f $Name, $ev.Exception)`
                        -ErrorId "UnRegisterFailed" `
                        -ErrorCategory InvalidOperation       
        }
        else
        {
            Write-Verbose -Message ($localizedData.UnRegisteredSuccess -f $($Name))            
        }                    
    }  
 }

Export-ModuleMember -function Get-TargetResource, Set-TargetResource, Test-TargetResource


# SIG # Begin signature block
