function New-MBSAPIStorageAccountSetting {
    <#
    .SYNOPSIS
    Creates MBS.API.StorageAccountSetting type object.
    
    .DESCRIPTION
    Returns StorageAccountSetting type object 
    
    .PARAMETER DisplayName
    Storage account display name
    
    .PARAMETER AmazonS3
    Specify for Amazon S3 storage settings
    
    .PARAMETER AmazonS3China
    Specify for Amazon S3 China storage settings
    
    .PARAMETER Azure
    Specify for Azure storage settings
    
    .PARAMETER OpenStack
    Specify for OpenStack storage settings
    
    .PARAMETER OracleCloud
    Specify for OracleCloud storage settings
    
    .PARAMETER S3Compatible
    Specify for S3Compatible storage settings
    
    .PARAMETER Scality
    Specify for Scality storage settings
    
    .PARAMETER CenturyLink
    Specify for CenturyLink storage settings
    
    .PARAMETER ArubaCloud
    Specify for ArubaCloud storage settings
    
    .PARAMETER BackblazeB2
    Specify for Backblaze B2 storage settings
    
    .PARAMETER Cloudian
    Specify for Cloudian storage settings
    
    .PARAMETER Connectria
    Specify for Connectria storage settings
    
    .PARAMETER Constant
    Specify for Constant storage settings
    
    .PARAMETER DreamObjects
    Specify for DreamObjects storage settings
    
    .PARAMETER Dunkel
    Specify for Dunkel storage settings
    
    .PARAMETER GreenQloud
    Specify for GreenQloud storage settings
    
    .PARAMETER HostEurope
    Specify for HostEurope storage settings
    
    .PARAMETER Seeweb
    Specify for Seeweb storage settings
    
    .PARAMETER ThinkOn
    Specify for ThinkOn storage settings
    
    .PARAMETER Tiscali
    Specify for Tiscali storage settings
    
    .PARAMETER Walrus
    Specify for Walrus storage settings
    
    .PARAMETER FS
    Specify for file system storage settings
    
    .PARAMETER GoogleCloudPlatform
    Specify for Google Cloud Platform settings
    
    .PARAMETER Wasabi
    Specify for Wasabi settings
    
    .PARAMETER Minio
    Specify for Minio settings
    
    .PARAMETER ServiceAccountEmail
    Service Account Email
    
    .PARAMETER BinaryKeyAsBase64
    Binary Key as Base64 string
    
    .PARAMETER ProjectID
    Project ID
    
    .PARAMETER AccountName
    Account name
    
    .PARAMETER SharedKey
    Shared key
    
    .PARAMETER Login
    User Login
    
    .PARAMETER Pass
    User Password
    
    .PARAMETER Path
    Path to local or shared folder
    
    .PARAMETER AccessKey
    Access key
    
    .PARAMETER SecretKey
    Secret key
    
    .PARAMETER IsGovCloud
    Gov Cloud. Required only Amazon S3
    
    .PARAMETER UseNativeMultipartUpload
    Use Native Multipart Upload. Required for Aruba Cloud, Backblaze B2, Connectria, Constant, DreamObjects, Dunkel, GreenQloud, HostEurope, Seeweb, ThinkOn, Tiscali and Walrus accounts
    
    .PARAMETER HTTPEnpoint
    HTTP endpoint
    
    .PARAMETER HTTPSEndpoint
    HTTPS endpoint
    
    .PARAMETER SignatureVersion
    Signature version. Required for S3Compatible accounts
    
    .PARAMETER IgnoreCertificate
    Ignore SSL certificate
    
    .PARAMETER NotCheckCredentials
    Do not check credentials (no public access)
    
    .PARAMETER UserName
    User name
    
    .PARAMETER ApiKey
    Api Key
    
    .PARAMETER AuthService
    Authentication service
    
    .PARAMETER KeyStoneVersion
    Keystone version
    
    .PARAMETER TenantType
    Tenant Type. Required for Key stone version 2
    
    .PARAMETER Tenant
    Tenant
    
    .PARAMETER UseInternalURLs
    Use internal URLs. Required for Key stone version 2 and 3
    
    .PARAMETER DomainType
    Domain Type. Required for Key stone version 3
    
    .PARAMETER Domain
    Domain. Required for Key stone version 3
    
    .PARAMETER UseScope
    Use scope. Required for Key stone version 3
    
    .PARAMETER ProjectType
    Project type. Required for Key stone version 3 and if UseScope is true
    
    .PARAMETER Project
    Project. Required for Key stone version 3 and if UseScope is true
    
    .EXAMPLE
        New-MBSAPIStorageAccountSetting -Minio -DisplayName 'Minio Storage' -AccessKey OIUERJKHF637623KJH87 -SecretKey EWRYERYHJNBDFMNB -HTTPEnpoint https://MINIOSERVER:PORT -IgnoreCertificate $true -NotCheckCredentials $false
    
        Create Minio storage account settings

    .EXAMPLE
        New-MBSAPIStorageAccountSetting -AmazonS3 -DisplayName 'Amazon S3' -AccessKey ACCESS_KEY -SecretKey SECRET_KEY -IsGovCloud $false

        Create Amazon S3 storage account settings

    .EXAMPLE
        New-MBSAPIStorageAccountSetting -Azure -DisplayName 'Azure Storage' -AccountName ACCOUNT_NAME -SharedKey SHARED_KEY

        Create Azure storage account settings

    .INPUTS
        None

    .OUTPUTS
        MBS.API.StorageAccountSetting

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/new-mbsapistorageaccountsetting
    #>

    [CmdletBinding()]
    param (
		#
        [Parameter(Mandatory=$true, HelpMessage="Storage Account Display Name")]
        [string]$DisplayName,
		#
        [Parameter(Mandatory=$true, ParameterSetName='AmazonS3')]
        [switch]$AmazonS3,
		#
        [Parameter(Mandatory=$true, ParameterSetName='AmazonS3China')]
        [switch]$AmazonS3China,
		#
        [Parameter(Mandatory=$true, ParameterSetName='Azure')]
        [switch]$Azure,
		#
        [Parameter(Mandatory=$true, ParameterSetName='OpenStack')]
        [switch]$OpenStack,
		#
        [Parameter(Mandatory=$true, ParameterSetName='OracleCloud')]
        [switch]$OracleCloud,
		#
        [Parameter(Mandatory=$true, ParameterSetName='S3Compatible')]
        [switch]$S3Compatible,
		#
        [Parameter(Mandatory=$true, ParameterSetName='Scality')]
        [switch]$Scality,
		#
        [Parameter(Mandatory=$true, ParameterSetName='CenturyLink')]
        [switch]$CenturyLink,
		#
        [Parameter(Mandatory=$true, ParameterSetName='ArubaCloud')]
        [switch]$ArubaCloud,
		#
        [Parameter(Mandatory=$true, ParameterSetName='BackblazeB2')]
        [switch]$BackblazeB2,
		#
        [Parameter(Mandatory=$true, ParameterSetName='Cloudian')]
        [switch]$Cloudian,
		#
        [Parameter(Mandatory=$true, ParameterSetName='Connectria')]
        [switch]$Connectria,
		#
        [Parameter(Mandatory=$true, ParameterSetName='Constant')]
        [switch]$Constant,
		#
        [Parameter(Mandatory=$true, ParameterSetName='DreamObjects')]
        [switch]$DreamObjects,
		#
        [Parameter(Mandatory=$true, ParameterSetName='Dunkel')]
        [switch]$Dunkel,
		#
        [Parameter(Mandatory=$true, ParameterSetName='GreenQloud')]
        [switch]$GreenQloud,
		#
        [Parameter(Mandatory=$true, ParameterSetName='HostEurope')]
        [switch]$HostEurope,
		#
        [Parameter(Mandatory=$true, ParameterSetName='Seeweb')]
        [switch]$Seeweb,
		#
        [Parameter(Mandatory=$true, ParameterSetName='ThinkOn')]
        [switch]$ThinkOn,
		#
        [Parameter(Mandatory=$true, ParameterSetName='Tiscali')]
        [switch]$Tiscali,
		#
        [Parameter(Mandatory=$true, ParameterSetName='Walrus')]
        [switch]$Walrus,
		#
        [Parameter(Mandatory=$true, ParameterSetName='FS')]
        [switch]$FS,
		#
        [Parameter(Mandatory=$true, ParameterSetName='GoogleCloudPlatform')]
        [switch]$GoogleCloudPlatform,
		#
        [Parameter(Mandatory=$true, ParameterSetName='Wasabi')]
        [switch]$Wasabi,
		#
        [Parameter(Mandatory=$true, ParameterSetName='Minio')]
        [switch]$Minio,
		#
        [Parameter(Mandatory=$true, HelpMessage="Service Account Email", ParameterSetName='GoogleCloudPlatform')]
        [string]$ServiceAccountEmail,
		#
        [Parameter(Mandatory=$true, HelpMessage="Binary Key as Base64 string", ParameterSetName='GoogleCloudPlatform')]
        [string]$BinaryKeyAsBase64,
		#
        [Parameter(Mandatory=$true, HelpMessage="Project ID", ParameterSetName='GoogleCloudPlatform')]
        [string]$ProjectID,
        #
        [Parameter(Mandatory=$true, HelpMessage="Account name", ParameterSetName='Azure')]
        [string]$AccountName,
		#
        [Parameter(Mandatory=$true, HelpMessage="Shared key", ParameterSetName='Azure')]
        [string]$SharedKey,
        #
        [Parameter(Mandatory=$false, HelpMessage="Login", ParameterSetName='FS')]
        [string]$Login,
        #
        [Parameter(Mandatory=$false, HelpMessage="Password", ParameterSetName='FS')]
        [string]$Pass,
		#
        [Parameter(Mandatory=$true, HelpMessage="Path to shared data", ParameterSetName='FS')]
        [string]$Path,
		#
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='AmazonS3')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='AmazonS3China')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='S3Compatible')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='Scality')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='CenturyLink')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='ArubaCloud')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='BackblazeB2')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='Connectria')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='Constant')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='DreamObjects')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='Dunkel')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='GreenQloud')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='HostEurope')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='Seeweb')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='ThinkOn')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='Tiscali')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='Walrus')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='Wasabi')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='Minio')]
        [Parameter(Mandatory=$true, HelpMessage="Access key", ParameterSetName='Cloudian')]
        [string]$AccessKey,
		#
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='AmazonS3')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='AmazonS3China')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='S3Compatible')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='Scality')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='CenturyLink')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='ArubaCloud')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='BackblazeB2')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='Connectria')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='Constant')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='DreamObjects')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='Dunkel')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='GreenQloud')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='HostEurope')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='Seeweb')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='ThinkOn')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='Tiscali')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='Walrus')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='Wasabi')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='Minio')]
        [Parameter(Mandatory=$true, HelpMessage="Secret key", ParameterSetName='Cloudian')]
        [string]$SecretKey,
		#
        [Parameter(Mandatory=$true, HelpMessage="Is it a Gov Cloud account", ParameterSetName='AmazonS3')]
        [bool]$IsGovCloud = $false,
        #
        [Parameter(Mandatory=$true, HelpMessage="Use Native Multipart Upload", ParameterSetName='S3Compatible')]
        [Parameter(Mandatory=$true, HelpMessage="Use Native Multipart Upload.", ParameterSetName='ArubaCloud')]
        [Parameter(Mandatory=$true, HelpMessage="Use Native Multipart Upload.", ParameterSetName='BackblazeB2')]
        [Parameter(Mandatory=$true, HelpMessage="Use Native Multipart Upload.", ParameterSetName='Connectria')]
        [Parameter(Mandatory=$true, HelpMessage="Use Native Multipart Upload.", ParameterSetName='Constant')]
        [Parameter(Mandatory=$true, HelpMessage="Use Native Multipart Upload.", ParameterSetName='DreamObjects')]
        [Parameter(Mandatory=$true, HelpMessage="Use Native Multipart Upload.", ParameterSetName='Dunkel')]
        [Parameter(Mandatory=$true, HelpMessage="Use Native Multipart Upload.", ParameterSetName='GreenQloud')]
        [Parameter(Mandatory=$true, HelpMessage="Use Native Multipart Upload.", ParameterSetName='HostEurope')]
        [Parameter(Mandatory=$true, HelpMessage="Use Native Multipart Upload.", ParameterSetName='Seeweb')]
        [Parameter(Mandatory=$true, HelpMessage="Use Native Multipart Upload.", ParameterSetName='ThinkOn')]
        [Parameter(Mandatory=$true, HelpMessage="Use Native Multipart Upload.", ParameterSetName='Tiscali')]
        [Parameter(Mandatory=$true, HelpMessage="Use Native Multipart Upload.", ParameterSetName='Walrus')]
        [bool]$UseNativeMultipartUpload,
        #
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='S3Compatible')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='Scality')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='CenturyLink')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='ArubaCloud')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='BackblazeB2')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='Connectria')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='Constant')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='DreamObjects')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='Dunkel')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='GreenQloud')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='HostEurope')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='Seeweb')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='ThinkOn')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='Tiscali')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='Walrus')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='Minio')]
        [Parameter(Mandatory=$false, HelpMessage="HTTP endpoint", ParameterSetName='Cloudian')]
        [string]$HTTPEnpoint,
        #
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='S3Compatible')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='Scality')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='CenturyLink')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='ArubaCloud')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='BackblazeB2')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='Connectria')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='Constant')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='DreamObjects')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='Dunkel')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='GreenQloud')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='HostEurope')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='Seeweb')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='ThinkOn')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='Tiscali')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='Walrus')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='Minio')]
        [Parameter(Mandatory=$false, HelpMessage="HTTPS endpoint", ParameterSetName='Cloudian')]
        [string]$HTTPSEndpoint,
        #
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='Scality')]
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='S3Compatible')]
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='CenturyLink')]
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='ArubaCloud')]
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='BackblazeB2')]
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='Connectria')]
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='Constant')]
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='DreamObjects')]
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='Dunkel')]
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='GreenQloud')]
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='HostEurope')]
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='Seeweb')]
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='ThinkOn')]
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='Tiscali')]
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='Walrus')]
        [Parameter(Mandatory=$false, HelpMessage="Signature version. Required for S3Compatible accounts", ParameterSetName='Cloudian')]
        [MBS.API.SignatureVersion]$SignatureVersion = 2,
		#
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='OpenStack')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='Scality')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='S3Compatible')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='CenturyLink')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='ArubaCloud')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='BackblazeB2')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='Connectria')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='Constant')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='DreamObjects')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='Dunkel')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='GreenQloud')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='HostEurope')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='Seeweb')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='ThinkOn')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='Tiscali')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='Walrus')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='Minio')]
        [Parameter(Mandatory=$false, HelpMessage="Ignore certificate", ParameterSetName='Cloudian')]
        [bool]$IgnoreCertificate,
		#
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='OpenStack')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='S3Compatible')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='Scality')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='CenturyLink')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='ArubaCloud')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='BackblazeB2')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='Connectria')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='Constant')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='DreamObjects')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='Dunkel')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='GreenQloud')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='HostEurope')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='Seeweb')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='ThinkOn')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='Tiscali')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='Walrus')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='Minio')]
        [Parameter(Mandatory=$false, HelpMessage="Do not check credentials (no public access)", ParameterSetName='Cloudian')]
        [bool]$NotCheckCredentials,
		#
        [Parameter(Mandatory=$false, HelpMessage="User name", ParameterSetName='OpenStack')]
        [Parameter(Mandatory=$false, HelpMessage="User name", ParameterSetName='OracleCloud')]
        [string]$UserName,
		#
        [Parameter(Mandatory=$false, HelpMessage="Api Key", ParameterSetName='OpenStack')]
        [Parameter(Mandatory=$false, HelpMessage="Api Key", ParameterSetName='OracleCloud')]
        [string]$ApiKey,
		#
        [Parameter(Mandatory=$false, HelpMessage="Authentication service", ParameterSetName='OpenStack')]
        [Parameter(Mandatory=$false, HelpMessage="Authentication service", ParameterSetName='OracleCloud')]
        [string]$AuthService,
		#
        [Parameter(Mandatory=$false, HelpMessage="Keystone version", ParameterSetName='OpenStack')]
        [Parameter(Mandatory=$false, HelpMessage="Keystone version", ParameterSetName='OracleCloud')]
        [MBS.API.KeyStoneType]$KeyStoneVersion,
		#
        [Parameter(Mandatory=$false, HelpMessage="Tenant Type. Required for Key stone version 2", ParameterSetName='OpenStack')]
        [Parameter(Mandatory=$false, HelpMessage="Tenant Type. Required for Key stone version 2", ParameterSetName='OracleCloud')]
        [MBS.API.OpenStackType]$TenantType,
		#
        [Parameter(Mandatory=$false, HelpMessage="Tenant", ParameterSetName='OpenStack')]
        [Parameter(Mandatory=$false, HelpMessage="Tenant", ParameterSetName='OracleCloud')]
        [string]$Tenant,
		#
        [Parameter(Mandatory=$false, HelpMessage="Use internal URLs. Required for Key stone version 2 and 3", ParameterSetName='OpenStack')]
        [Parameter(Mandatory=$false, HelpMessage="Use internal URLs. Required for Key stone version 2 and 3", ParameterSetName='OracleCloud')]
        [bool]$UseInternalURLs,
		#
        [Parameter(Mandatory=$false, HelpMessage="Domain Type. Required for Key stone version 3", ParameterSetName='OpenStack')]
        [Parameter(Mandatory=$false, HelpMessage="Domain Type. Required for Key stone version 3", ParameterSetName='OracleCloud')]
        [MBS.API.OpenStackType]$DomainType,
		#
        [Parameter(Mandatory=$false, HelpMessage="Domain. Required for Key stone version 3", ParameterSetName='OpenStack')]
        [Parameter(Mandatory=$false, HelpMessage="Domain. Required for Key stone version 3", ParameterSetName='OracleCloud')]
        [string]$Domain,
		#
        [Parameter(Mandatory=$false, HelpMessage="Use scope. Required for Key stone version 3", ParameterSetName='OpenStack')]
        [Parameter(Mandatory=$false, HelpMessage="Use scope. Required for Key stone version 3", ParameterSetName='OracleCloud')]
        [bool]$UseScope,
		#
        [Parameter(Mandatory=$false, HelpMessage="Project type. Required for Key stone version 3 and if UseScope is true", ParameterSetName='OpenStack')]
        [Parameter(Mandatory=$false, HelpMessage="Project type. Required for Key stone version 3 and if UseScope is true", ParameterSetName='OracleCloud')]
        [MBS.API.OpenStackType]$ProjectType,
		#
        [Parameter(Mandatory=$false, HelpMessage="Project. Required for Key stone version 3 and if UseScope is true", ParameterSetName='OpenStack')]
        [Parameter(Mandatory=$false, HelpMessage="Project. Required for Key stone version 3 and if UseScope is true", ParameterSetName='OracleCloud')]
        [string]$Project
    )
    
    begin {
        
    }
    
    process {

        $StorageAccountSettigns = New-Object -TypeName MBS.API.StorageAccountSetting -Property @{DisplayName = $DisplayName;Type = $PSCmdlet.ParameterSetName} 

        switch ($PSCmdlet.ParameterSetName) {
            {$_ -in 'AmazonS3', 'AmazonS3China'} {
                $StorageAccountSettigns.AccountSettings = @{
                    $PSCmdlet.ParameterSetName = [MBS.API.AmazonS3]@{
                        AccessKey = $AccessKey
                        SecretKey = $SecretKey
                        IsGovCloud = $IsGovCloud
                }
             } | ConvertTo-Json
            }

            'Azure' {
                $StorageAccountSettigns.AccountSettings = @{
                    $PSCmdlet.ParameterSetName = [MBS.API.Azure]@{
                        AccountName = $AccountName
                        SharedKey = $SharedKey
                    }
                } | ConvertTo-Json
            }
            'OpenStack' {
                $StorageAccountSettigns.AccountSettings = @{
                    $PSCmdlet.ParameterSetName = [MBS.API.OpenStack]@{
                        IgnoreCertificate = $IgnoreCertificate
                        NotCheckCredentials = $NotCheckCredentials
                        UserName = $UserName
                        ApiKey = $ApiKey
                        AuthService = $AuthService
                        KeyStoneVersion = $KeyStoneVersion
                        TenantType = $TenantType
                        Tenant = $Tenant
                        UseInternalURLs = $UseInternalURLs
                        DomainType = $DomainType
                        Domain = $Domain
                        UseScope = $UseScope
                        ProjectType = $ProjectType
                        Project = $Project
                    }
                } | ConvertTo-Json
            }
            'OracleCloud' {
                $StorageAccountSettigns.AccountSettings = @{
                    $PSCmdlet.ParameterSetName = [MBS.API.OpenStackCompatible]@{
                        UserName = $UserName
                        ApiKey = $ApiKey
                        AuthService = $AuthService
                        KeyStoneVersion = $KeyStoneVersion
                        TenantType = $TenantType
                        Tenant = $Tenant
                        UseInternalURLs = $UseInternalURLs
                        DomainType = $DomainType
                        Domain = $Domain
                        UseScope = $UseScope
                        ProjectType = $ProjectType
                        Project = $Project
                    }
                } | ConvertTo-Json
            }
            {$_ -in 'S3Compatible', 'Scality', 'CenturyLink', 'ArubaCloud', 'BackblazeB2', 'Cloudian', 'Connectria', 'Constant', 'DreamObjects', 'Dunkel', 'GreenQloud', 'HostEurope', 'Seeweb', 'ThinkOn', 'Tiscali', 'Walrus'}{
                $StorageAccountSettigns.AccountSettings = @{
                    $PSCmdlet.ParameterSetName = [MBS.API.S3Compatible]@{
                        UseNativeMultipartUpload = $UseNativeMultipartUpload
                        HTTPEnpoint = $HTTPEnpoint
                        HTTPSEndpoint = $HTTPSEndpoint
                        IgnoreCertificate = $IgnoreCertificate
                        NotCheckCredentials = $NotCheckCredentials
                        SignatureVersion = $SignatureVersion
                        AccessKey = $AccessKey
                        SecretKey = $SecretKey
                        IsGovCloud = $IsGovCloud
                    }
                } | ConvertTo-Json
            }
            'FS' {
                $StorageAccountSettigns.AccountSettings = @{
                    $PSCmdlet.ParameterSetName = [MBS.API.FS]@{
                        Login = $Login
                        Pass = $Pass
                        Path = $Path
                    }
                } | ConvertTo-Json
            }
            'GoogleCloudPlatform' {
                $StorageAccountSettigns.AccountSettings = @{
                    $PSCmdlet.ParameterSetName = [MBS.API.GoogleCloudPlatform]@{
                        ServiceAccountEmail = $ServiceAccountEmail
                        BinaryKeyAsBase64 = $BinaryKeyAsBase64
                        ProjectID = $ProjectID
                    }
                } | ConvertTo-Json
            }
            'Wasabi' {
                $StorageAccountSettigns.AccountSettings = @{
                    $PSCmdlet.ParameterSetName = [MBS.API.Wasabi]@{
                        AccessKey = $AccessKey
                        SecretKey = $SecretKey
                    }
                } | ConvertTo-Json
            }
            'Minio' {
                $StorageAccountSettigns.AccountSettings = @{
                    $PSCmdlet.ParameterSetName = [MBS.API.Minio]@{
                        AccessKey = $AccessKey
                        SecretKey = $SecretKey
                        HTTPEnpoint = $HTTPEnpoint
                        HTTPSEndpoint = $HTTPSEndpoint
                        IgnoreCertificate = $IgnoreCertificate
                        NotCheckCredentials = $NotCheckCredentials
                    }
                } | ConvertTo-Json
            }
            Default {}
        }
        return $StorageAccountSettigns
    }
    
    end {
        
    }
}
# SIG # Begin signature block
