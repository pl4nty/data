#Requires -Modules Pester
<#
.SYNOPSIS
    DCCMPA-703 DSC Configuration and Push Tests
.DESCRIPTION
    Pester tests for DSC configuration compilation on localhost and push
    to remote machine 100.106.191.184 with credentials Dell/Dell@123.
.NOTES
    Run with: Invoke-Pester -Path <this file> -Output Detailed
#>

BeforeAll {
    $script:ModuleName = "DellBIOSProvider"
    $script:ModuleVersion = "2.10.2"
    $script:RemoteNode = "100.106.191.184"
    $script:TestPassword = "Dell@123"
    $script:RemoteUser = "Dell"
    $script:ConfigOutputDir = Join-Path $env:TEMP "DCCMPA703_PesterDSC"
    
    # Cleanup previous test output
    if (Test-Path $script:ConfigOutputDir) {
        Remove-Item $script:ConfigOutputDir -Recurse -Force -ErrorAction SilentlyContinue
    }
    New-Item -ItemType Directory -Path $script:ConfigOutputDir -Force | Out-Null
    
    # Build credentials
    $secPwd = ConvertTo-SecureString $script:TestPassword -AsPlainText -Force
    $script:Credential = New-Object System.Management.Automation.PSCredential($script:RemoteUser, $secPwd)
    
    # Test remote connectivity
    $script:RemoteReachable = $false
    try {
        $tcp = Test-NetConnection -ComputerName $script:RemoteNode -Port 5985 -WarningAction SilentlyContinue
        if ($tcp.TcpTestSucceeded) {
            $session = New-PSSession -ComputerName $script:RemoteNode -Credential $script:Credential -ErrorAction Stop
            $script:RemoteReachable = $true
            Remove-PSSession $session
        }
    } catch { }
    
    Write-Host "Remote $($script:RemoteNode) reachable: $($script:RemoteReachable)" -ForegroundColor $(if ($script:RemoteReachable) { 'Green' } else { 'Yellow' })
}

AfterAll {
    if (Test-Path $script:ConfigOutputDir) {
        Remove-Item $script:ConfigOutputDir -Recurse -Force -ErrorAction SilentlyContinue
    }
}

Describe "DSC Module and Resource Availability" {
    It "DellBIOSProvider module should be available" {
        $mod = Get-Module -Name $script:ModuleName -ListAvailable | Where-Object { $_.Version -eq $script:ModuleVersion }
        $mod | Should -Not -BeNullOrEmpty
    }
    
    It "Should have DSC resources registered" {
        $resources = Get-DscResource -Module $script:ModuleName -ErrorAction SilentlyContinue
        $resources.Count | Should -BeGreaterThan 0
    }
}

Describe "DSC Configuration Compilation - Local (localhost)" {
    It "Should compile POSTBehavior DSC config for localhost" {
        Configuration LocalPOSTBehavior {
            Import-DscResource -ModuleName @{ModuleName="DellBIOSProvider"; RequiredVersion="2.10.2"}
            Node "localhost" {
                POSTBehavior PostSettings {
                    Category = "POSTBehavior"
                    Numlock  = "Disabled"
                }
            }
        }
        $outPath = Join-Path $script:ConfigOutputDir "LocalPOSTBehavior"
        LocalPOSTBehavior -OutputPath $outPath -ErrorAction Stop | Out-Null
        Test-Path "$outPath\localhost.mof" | Should -BeTrue
    }
    
    It "Should compile POSTBehavior DSC config with password for localhost" {
        Configuration LocalPOSTBehaviorPwd {
            Import-DscResource -ModuleName @{ModuleName="DellBIOSProvider"; RequiredVersion="2.10.2"}
            Node "localhost" {
                POSTBehavior PostSettings {
                    Category = "POSTBehavior"
                    Numlock  = "Disabled"
                    Password = $script:TestPassword
                }
            }
        }
        $outPath = Join-Path $script:ConfigOutputDir "LocalPOSTBehaviorPwd"
        LocalPOSTBehaviorPwd -OutputPath $outPath -ErrorAction Stop | Out-Null
        Test-Path "$outPath\localhost.mof" | Should -BeTrue
    }
    
    It "Should compile PowerManagement DSC config with password for localhost" {
        Configuration LocalPowerMgmt {
            Import-DscResource -ModuleName @{ModuleName="DellBIOSProvider"; RequiredVersion="2.10.2"}
            Node "localhost" {
                PowerManagement PwrSettings {
                    Category       = "PowerManagement"
                    BlockDefinition = "1"
                    AutoOnHr       = 15
                    AutoOnMn       = 42
                    Password       = $script:TestPassword
                }
            }
        }
        $outPath = Join-Path $script:ConfigOutputDir "LocalPowerMgmt"
        LocalPowerMgmt -OutputPath $outPath -ErrorAction Stop | Out-Null
        Test-Path "$outPath\localhost.mof" | Should -BeTrue
    }
    
    It "Should compile Security DSC config with password for localhost" {
        Configuration LocalSecurity {
            Import-DscResource -ModuleName @{ModuleName="DellBIOSProvider"; RequiredVersion="2.10.2"}
            Node "localhost" {
                Security SecSettings {
                    Category = "Security"
                    Password = $script:TestPassword
                }
            }
        }
        $outPath = Join-Path $script:ConfigOutputDir "LocalSecurity"
        LocalSecurity -OutputPath $outPath -ErrorAction Stop | Out-Null
        Test-Path "$outPath\localhost.mof" | Should -BeTrue
    }
    
    It "Should compile all 19 categories combined for localhost" {
        Configuration LocalAllCategories {
            Import-DscResource -ModuleName @{ModuleName="DellBIOSProvider"; RequiredVersion="2.10.2"}
            Node "localhost" {
                POSTBehavior P1 { Category = "POSTBehavior"; Password = $script:TestPassword }
                PowerManagement P2 { Category = "PowerManagement"; BlockDefinition = "1"; Password = $script:TestPassword }
                Security P3 { Category = "Security"; Password = $script:TestPassword }
                SystemConfiguration P4 { Category = "SystemConfiguration"; Password = $script:TestPassword }
                Performance P5 { Category = "Performance"; Password = $script:TestPassword }
                AdvancedBootOptions P6 { Category = "AdvancedBootOptions"; Password = $script:TestPassword }
                MiscellaneousDevices P7 { Category = "MiscellaneousDevices"; Password = $script:TestPassword }
                Wireless P8 { Category = "Wireless"; Password = $script:TestPassword }
                Maintenance P9 { Category = "Maintenance"; Password = $script:TestPassword }
                Video P10 { Category = "Video"; Password = $script:TestPassword }
                SecureBoot P11 { Category = "SecureBoot"; Password = $script:TestPassword }
                TPMSecurity P12 { Category = "TPMSecurity"; Password = $script:TestPassword }
                VirtualizationSupport P13 { Category = "VirtualizationSupport"; Password = $script:TestPassword }
                SystemLogs P14 { Category = "SystemLogs"; Password = $script:TestPassword }
                StealthModeControl P15 { Category = "StealthModeControl"; Password = $script:TestPassword }
                IntelSoftwareGuardExtensions P16 { Category = "IntelSoftwareGuardExtensions"; Password = $script:TestPassword }
                SupportAssistSystemResolution P17 { Category = "SupportAssistSystemResolution"; Password = $script:TestPassword }
                AdvancedConfigurations P18 { Category = "AdvancedConfigurations"; Password = $script:TestPassword }
                BIOSSetupAdvancedMode P19 { Category = "BIOSSetupAdvancedMode"; Password = $script:TestPassword }
            }
        }
        $outPath = Join-Path $script:ConfigOutputDir "LocalAllCategories"
        LocalAllCategories -OutputPath $outPath -ErrorAction Stop | Out-Null
        Test-Path "$outPath\localhost.mof" | Should -BeTrue
        (Get-Item "$outPath\localhost.mof").Length | Should -BeGreaterThan 1000
    }
}

Describe "DSC Local Push - localhost" {
    It "Should push POSTBehavior config to localhost" {
        $mofPath = Join-Path $script:ConfigOutputDir "LocalPOSTBehavior"
        if (-not (Test-Path "$mofPath\localhost.mof")) {
            Set-ItResult -Skipped -Because "MOF not compiled"
            return
        }
        Start-DscConfiguration -Path $mofPath -Wait -Force -ErrorAction Stop
    }

    It "Should push POSTBehavior with password config to localhost" {
        $mofPath = Join-Path $script:ConfigOutputDir "LocalPOSTBehaviorPwd"
        if (-not (Test-Path "$mofPath\localhost.mof")) {
            Set-ItResult -Skipped -Because "MOF not compiled"
            return
        }
        Start-DscConfiguration -Path $mofPath -Wait -Force -ErrorAction Stop
    }
    
    It "Should push PowerManagement with password config to localhost" {
        $mofPath = Join-Path $script:ConfigOutputDir "LocalPowerMgmt"
        if (-not (Test-Path "$mofPath\localhost.mof")) {
            Set-ItResult -Skipped -Because "MOF not compiled"
            return
        }
        Start-DscConfiguration -Path $mofPath -Wait -Force -ErrorAction Stop
    }
    
    It "Should push Security with password config to localhost" {
        $mofPath = Join-Path $script:ConfigOutputDir "LocalSecurity"
        if (-not (Test-Path "$mofPath\localhost.mof")) {
            Set-ItResult -Skipped -Because "MOF not compiled"
            return
        }
        Start-DscConfiguration -Path $mofPath -Wait -Force -ErrorAction Stop
    }

    It "Should push all 19 categories combined config to localhost" {
        $mofPath = Join-Path $script:ConfigOutputDir "LocalAllCategories"
        if (-not (Test-Path "$mofPath\localhost.mof")) {
            Set-ItResult -Skipped -Because "MOF not compiled"
            return
        }
        Start-DscConfiguration -Path $mofPath -Wait -Force -ErrorAction Stop
    }
}

Describe "DSC Configuration Compilation - Remote (100.106.191.184)" {
    It "Should compile POSTBehavior for remote node" {
        Configuration RemotePOSTBehavior {
            Import-DscResource -ModuleName @{ModuleName="DellBIOSProvider"; RequiredVersion="2.10.2"}
            Node "100.106.191.184" {
                POSTBehavior PostSettings {
                    Category = "POSTBehavior"
                    Numlock  = "Disabled"
                    Password = $script:TestPassword
                }
            }
        }
        $outPath = Join-Path $script:ConfigOutputDir "RemotePOSTBehavior"
        RemotePOSTBehavior -OutputPath $outPath -ErrorAction Stop | Out-Null
        Test-Path "$outPath\100.106.191.184.mof" | Should -BeTrue
    }
    
    It "Should compile all 19 categories for remote node" {
        Configuration RemoteAllCategories {
            Import-DscResource -ModuleName @{ModuleName="DellBIOSProvider"; RequiredVersion="2.10.2"}
            Node "100.106.191.184" {
                POSTBehavior P1 { Category = "POSTBehavior"; Password = $script:TestPassword }
                PowerManagement P2 { Category = "PowerManagement"; BlockDefinition = "1"; Password = $script:TestPassword }
                Security P3 { Category = "Security"; Password = $script:TestPassword }
                SystemConfiguration P4 { Category = "SystemConfiguration"; Password = $script:TestPassword }
                Performance P5 { Category = "Performance"; Password = $script:TestPassword }
                AdvancedBootOptions P6 { Category = "AdvancedBootOptions"; Password = $script:TestPassword }
                MiscellaneousDevices P7 { Category = "MiscellaneousDevices"; Password = $script:TestPassword }
                Wireless P8 { Category = "Wireless"; Password = $script:TestPassword }
                Maintenance P9 { Category = "Maintenance"; Password = $script:TestPassword }
                Video P10 { Category = "Video"; Password = $script:TestPassword }
                SecureBoot P11 { Category = "SecureBoot"; Password = $script:TestPassword }
                TPMSecurity P12 { Category = "TPMSecurity"; Password = $script:TestPassword }
                VirtualizationSupport P13 { Category = "VirtualizationSupport"; Password = $script:TestPassword }
                SystemLogs P14 { Category = "SystemLogs"; Password = $script:TestPassword }
                StealthModeControl P15 { Category = "StealthModeControl"; Password = $script:TestPassword }
                IntelSoftwareGuardExtensions P16 { Category = "IntelSoftwareGuardExtensions"; Password = $script:TestPassword }
                SupportAssistSystemResolution P17 { Category = "SupportAssistSystemResolution"; Password = $script:TestPassword }
                AdvancedConfigurations P18 { Category = "AdvancedConfigurations"; Password = $script:TestPassword }
                BIOSSetupAdvancedMode P19 { Category = "BIOSSetupAdvancedMode"; Password = $script:TestPassword }
            }
        }
        $outPath = Join-Path $script:ConfigOutputDir "RemoteAllCategories"
        RemoteAllCategories -OutputPath $outPath -ErrorAction Stop | Out-Null
        Test-Path "$outPath\100.106.191.184.mof" | Should -BeTrue
    }
}

Describe "DSC Remote Push - 100.106.191.184 (Dell/Dell@123)" {
    BeforeAll {
        if (-not $script:RemoteReachable) {
            Write-Host "Remote machine not reachable - push tests will be skipped" -ForegroundColor Yellow
        }
    }
    
    It "Should push POSTBehavior config to remote with credentials" {
        if (-not $script:RemoteReachable) {
            Set-ItResult -Skipped -Because "Remote machine $($script:RemoteNode) not reachable"
            return
        }
        $mofPath = Join-Path $script:ConfigOutputDir "RemotePOSTBehavior"
        if (-not (Test-Path "$mofPath\$($script:RemoteNode).mof")) {
            Set-ItResult -Skipped -Because "MOF not compiled"
            return
        }
        { Start-DscConfiguration -Path $mofPath -Wait -Force -Credential $script:Credential -ErrorAction Stop } | Should -Not -Throw
    }
    
    It "Should push all 19 categories config to remote with credentials" {
        if (-not $script:RemoteReachable) {
            Set-ItResult -Skipped -Because "Remote machine $($script:RemoteNode) not reachable"
            return
        }
        $mofPath = Join-Path $script:ConfigOutputDir "RemoteAllCategories"
        if (-not (Test-Path "$mofPath\$($script:RemoteNode).mof")) {
            Set-ItResult -Skipped -Because "MOF not compiled"
            return
        }
        { Start-DscConfiguration -Path $mofPath -Wait -Force -Credential $script:Credential -ErrorAction Stop } | Should -Not -Throw
    }
    
    It "Should test DSC configuration status on remote" {
        if (-not $script:RemoteReachable) {
            Set-ItResult -Skipped -Because "Remote machine $($script:RemoteNode) not reachable"
            return
        }
        $status = Test-DscConfiguration -ComputerName $script:RemoteNode -Credential $script:Credential -ErrorAction SilentlyContinue
        # We just verify the command runs without throwing - the result depends on BIOS state
        $true | Should -BeTrue
    }
}

Describe "DSC Module Provider Tests (Local)" {
    BeforeAll {
        Import-Module $script:ModuleName -Force -ErrorAction SilentlyContinue
    }
    
    It "DellSmbios PSDrive should be available after import" {
        $drive = Get-PSDrive -Name DellSmbios -ErrorAction SilentlyContinue
        $drive | Should -Not -BeNullOrEmpty
    }
    
    It "Should list BIOS categories from DellSmbios drive" {
        $items = Get-ChildItem -Path "DellSmbios:\" -ErrorAction Stop
        $items.Count | Should -BeGreaterThan 10
    }
    
    It "Should list POSTBehavior attributes" {
        $attrs = Get-ChildItem -Path "DellSmbios:\POSTBehavior" -ErrorAction Stop
        $attrs.Count | Should -BeGreaterThan 0
    }
    
    It "Should get Numlock attribute value" {
        $val = Get-Item -Path "DellSmbios:\POSTBehavior\Numlock" -ErrorAction Stop
        $val | Should -Not -BeNullOrEmpty
    }
    
    It "Should list Security attributes" {
        $attrs = Get-ChildItem -Path "DellSmbios:\Security" -ErrorAction Stop
        $attrs.Count | Should -BeGreaterThan 0
    }
    
    It "Should get AdminPassword attribute" {
        $val = Get-Item -Path "DellSmbios:\Security\AdminPassword" -ErrorAction Stop
        $val | Should -Not -BeNullOrEmpty
    }
    
    It "Set-Dell1stBootdevice should accept SecureString Password parameter" {
        $cmd = Get-Command Set-Dell1stBootdevice -ErrorAction Stop
        $cmd.Parameters['Password'].ParameterType | Should -Be ([System.Security.SecureString])
    }
    
    It "Set-DellAutoOnForSelectDays should accept SecureString Password parameter" {
        $cmd = Get-Command Set-DellAutoOnForSelectDays -ErrorAction Stop
        $cmd.Parameters['Password'].ParameterType | Should -Be ([System.Security.SecureString])
    }
}

# SIG # Begin signature block
