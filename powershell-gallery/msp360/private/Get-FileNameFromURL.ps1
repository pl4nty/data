function Get-FileNameFromURL {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$true)]
        [string]
        $URL,
        [parameter(Mandatory=$false)]
        [switch]
        $ParseFromURLifError
    )
    
    begin {
        
    }
    
    process {
        #[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        #[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}

        $WebRequest = [System.Net.WebRequest]::Create($URL)

        # BypassCache level is used by default. If needed, the lines below can be uncommented to set NoCacheNoStore level for the request
        #$NoCachePolicy = [System.Net.Cache.RequestCachePolicy]::New([System.Net.Cache.RequestCacheLevel]"NoCacheNoStore")
        #$WebRequest.CachePolicy = $NoCachePolicy

        $Response = $WebRequest.GetResponse()

        if ($Response) {
            Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Content-Type: $($Response.ContentType)"
            Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Content-Length: $($Response.ContentLength)"
            Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): IsFromCache: $($Response.IsFromCache)"
            
            $DispositionHeader = $Response.Headers['Content-Disposition']
            if ($DispositionHeader) {
                $Disposition = [System.Net.Mime.ContentDisposition]::new($DispositionHeader)
                #
                $FileName = $Disposition.FileName
            } elseif ($ParseFromURLifError) {
                Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): The response didn't return Content-Disposition header. Parsing file name from URL"
                if (($Response.ContentType -eq "application/octet-stream") -Or ($Response.ContentType -eq "application/x-msi")) {
                    $ResponseUri = $Response.ResponseUri.ToString()
                    $FileNameParseFromURL = $ResponseUri.Substring($ResponseUri.LastIndexOf('/')+1)
                    $VerboseMessageAdd = " (parsed from URL)"
                    #
                    $FileName = $FileNameParseFromURL
                } else {
                    Write-Error "ERROR: The file from the response URL is not of type ""application/octet-stream"" or ""application/x-msi""."
                }
            } else {
                Write-Error "ERROR: The response to the provided URL does not include information about downloadable content."
            }

            $Response.Dispose()

            if ($FileName) {
                Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): FileName$($VerboseMessageAdd): $($FileName)"
                return $FileName
            } else {
                return $false
            }
        }
    }
    
    end {
        
    }
}
# SIG # Begin signature block
