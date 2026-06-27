#!/usr/bin/perl
#--------------------------------------------------------------------------------------------------------------
# Arguments
# ARGV[0] = Complete file path which contains the list of the published cmdlets in the module. (For example. .\CmdletsToExport.txt)
# ARGV[1] = Build version (For example. 16.0.3264.0)
# ARGV[2] = Output file path where the module psd1 file needs to be generated. (For example. ExchangeOnlineManagement.psd1)
#
#--------------------------------------------------------------------------------------------------------------
my $cmdletNamesFile = $ARGV[0];
my $BuildVersion = $ARGV[1];
my $outputPsdFile = $ARGV[2];

open(DATA, "< $cmdletNamesFile") or die "Couldn't open file $cmdletNamesFile. $!";
open (OUTPUT, "> $outputPsdFile") || die "problem opening or creating $outputPsdFile.\n";

#Calculate the module version
my @BV = split('\.', $BuildVersion);
my @moduleVersion;
for (my $i=1; $i<= $#BV; $i++) {
    push @moduleVersion, $BV[$i];
}
# $MV should be looking like 00.3264.000 if BuildVersion is like 16.00.3264.000
my $MV = join('.', @moduleVersion);

my @PMV;
foreach(@moduleVersion) {
    my $var = $_;
    $var =~ s/^[0]*/0/g;
    $var =~ s/^0(.+?)/$1/gm;
    push @PMV, $var;
}
# $PowerShellModuleVersion should be looking like 0.3264.0 if $moduleVersion is like 00.3264.000 and should look like 1.3264.0 if $moduleVersion is like 0001.3264.000
my $PowerShellModuleVersion = join('.', @PMV);

my @finalCmdletNames;
while(<DATA>) {
    my @cmdletNames =  split '\n', $_;
    foreach my $cmdlet (@cmdletNames) {
        if (not($cmdlet =~ /^#/)) {
            push @finalCmdletNames, "'$cmdlet'";
        }
    }
}

print OUTPUT "\@{\n";
print OUTPUT "RootModule = 'ExchangeOnlineManagementBeta.psm1'\n";
print OUTPUT "FunctionsToExport = \@('Connect-ExchangeOnline', 'Connect-IPPSSession', 'Disconnect-ExchangeOnline')\n";
print OUTPUT "ModuleVersion = '$MV'\n";
print OUTPUT "GUID = 'B5ECED50-AFA4-455B-847A-D8FB64140A22'\n";
print OUTPUT "Author = 'Microsoft Corporation'\n";
print OUTPUT "CompanyName = 'Microsoft Corporation'\n";
print OUTPUT "Copyright = '(c) 2020 Microsoft. All rights reserved.'\n";
print OUTPUT "Description = 'This is a public preview release of Exchange Online PowerShell V2 module.\n";
print OUTPUT "Please check the documentation here - https://aka.ms/exops-docs. \n";
print OUTPUT "Send your feedback/suggestions to exocmdletpreview\@service.microsoft.com'\n";
print OUTPUT "PowerShellVersion = '3.0'\n";
print OUTPUT "CmdletsToExport = @(";
print OUTPUT join(',', @finalCmdletNames);
print OUTPUT ")\n";
print OUTPUT "FileList = \@('.\\Microsoft.Exchange.Management.AdminApiProvider.dll',\n";
print OUTPUT "        '.\\Microsoft.Exchange.Management.ExoPowershellGalleryModule.dll',\n";
print OUTPUT "        '.\\Microsoft.Exchange.Management.RestApiClient.dll',\n";
print OUTPUT "        '.\\Microsoft.IdentityModel.Clients.ActiveDirectory.dll',\n";
print OUTPUT "        '.\\Microsoft.OData.Client.dll',\n";
print OUTPUT "        '.\\Microsoft.OData.Core.dll',\n";
print OUTPUT "        '.\\Microsoft.OData.Edm.dll',\n";
print OUTPUT "        '.\\Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.dll',\n";
print OUTPUT "        '.\\Microsoft.Spatial.dll',\n";
print OUTPUT "        '.\\Newtonsoft.Json.dll',\n";
print OUTPUT "        '.\\System.IO.Abstractions.dll',\n";
print OUTPUT "        '.\\System.Management.Automation.dll',\n";
print OUTPUT "        '.\\license.txt')\n";
print OUTPUT "\n";
print OUTPUT "PrivateData = \@{\n";
print OUTPUT "    PSData = \@{\n";
print OUTPUT "    ReleaseNotes = 'Public preview release of Exchange Online PowerShell V2 Module.'\n";
print OUTPUT "    LicenseUri=\"http://aka.ms/azps-license\"\n";
print OUTPUT "    }\n";
print OUTPUT "}\n";
print OUTPUT "}\n";
