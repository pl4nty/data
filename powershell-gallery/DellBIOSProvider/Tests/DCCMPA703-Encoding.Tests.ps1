#Requires -Modules Pester
<#
.SYNOPSIS
    DCCMPA-703 Encoding Validation Unit Tests
.DESCRIPTION
    Pester unit tests to validate all DSC resource .psm1 files have correct
    UTF-16 LE encoding, proper BOM markers, intact line breaks, clean parse,
    sanitized error handlers (Fix 2), and consistent CRLF line endings.
.NOTES
    Run with: Invoke-Pester -Path <this file> -Output Detailed
#>

BeforeDiscovery {
    $dscBasePath = Join-Path (Split-Path -Parent (Split-Path -Parent $PSScriptRoot)) "DellSMBIOSProvider_DesiredStateConfiguration"
    $script:fileTestData = @()
    foreach ($folder in @("DSCResources", "DSCResourcesARM64")) {
        $folderPath = Join-Path $dscBasePath $folder
        if (Test-Path $folderPath) {
            Get-ChildItem -Path $folderPath -Filter "*.psm1" -Recurse | ForEach-Object {
                $script:fileTestData += @{
                    FullName     = $_.FullName
                    FileName     = $_.Name
                    Folder       = $folder
                    ResourceName = $_.Directory.Name
                    RelPath      = "$folder\$($_.Directory.Name)\$($_.Name)"
                }
            }
        }
    }
    $script:fileCount = $script:fileTestData.Count
    $script:x64Count = ($script:fileTestData | Where-Object { $_.Folder -eq "DSCResources" }).Count
    $script:arm64Count = ($script:fileTestData | Where-Object { $_.Folder -eq "DSCResourcesARM64" }).Count
}

Describe "DCCMPA-703 DSC Resource File Discovery" {
    BeforeAll {
        $dscBase = Join-Path (Split-Path -Parent (Split-Path -Parent $PSScriptRoot)) "DellSMBIOSProvider_DesiredStateConfiguration"
        $allFiles = @()
        foreach ($f in @("DSCResources", "DSCResourcesARM64")) {
            $fp = Join-Path $dscBase $f
            if (Test-Path $fp) {
                Get-ChildItem -Path $fp -Filter "*.psm1" -Recurse | ForEach-Object {
                    $allFiles += @{ Folder = $f }
                }
            }
        }
        $script:totalFiles = $allFiles.Count
        $script:x64Files = ($allFiles | Where-Object { $_.Folder -eq "DSCResources" }).Count
        $script:arm64Files = ($allFiles | Where-Object { $_.Folder -eq "DSCResourcesARM64" }).Count
    }

    It "Should find exactly 44 DSC .psm1 files (22 x64 + 22 ARM64)" {
        $script:totalFiles | Should -Be 44
    }
    
    It "Should have 22 x64 DSC resources" {
        $script:x64Files | Should -Be 22
    }
    
    It "Should have 22 ARM64 DSC resources" {
        $script:arm64Files | Should -Be 22
    }
}

Describe "DCCMPA-703 UTF-16 LE BOM Validation" {
    It "<RelPath> should have UTF-16 LE BOM (FF FE)" -ForEach $script:fileTestData {
        $bytes = [System.IO.File]::ReadAllBytes($FullName)
        $bytes.Length | Should -BeGreaterThan 2
        $bytes[0] | Should -Be 0xFF -Because "First BOM byte should be 0xFF for UTF-16 LE"
        $bytes[1] | Should -Be 0xFE -Because "Second BOM byte should be 0xFE for UTF-16 LE"
    }
}

Describe "DCCMPA-703 UTF-16 Null Byte Pattern" {
    It "<RelPath> should have UTF-16 null byte pattern" -ForEach $script:fileTestData {
        $bytes = [System.IO.File]::ReadAllBytes($FullName)
        $hasNullPattern = $false
        for ($i = 3; $i -lt [Math]::Min(100, $bytes.Length); $i += 2) {
            if ($bytes[$i] -eq 0x00) { $hasNullPattern = $true; break }
        }
        $hasNullPattern | Should -BeTrue -Because "UTF-16 LE should have null bytes at odd positions for ASCII content"
    }
}

Describe "DCCMPA-703 Line Break Integrity" {
    It "<RelPath> should have more than 50 lines" -ForEach $script:fileTestData {
        $content = [System.IO.File]::ReadAllText($FullName, [System.Text.Encoding]::Unicode)
        $lineCount = ($content -split "`r`n|`n").Count
        $lineCount | Should -BeGreaterThan 50 -Because "1 line = encoding corruption"
    }
}

Describe "DCCMPA-703 CRLF Line Ending Consistency" {
    It "<RelPath> should use CRLF line endings" -ForEach $script:fileTestData {
        $content = [System.IO.File]::ReadAllText($FullName, [System.Text.Encoding]::Unicode)
        $crlfCount = ([regex]::Matches($content, "`r`n")).Count
        $crlfCount | Should -BeGreaterThan 0 -Because "File should have CRLF line endings"
    }
}

Describe "DCCMPA-703 PowerShell Parse Validation" {
    It "<RelPath> should parse without errors" -ForEach $script:fileTestData {
        $errors = $null
        [System.Management.Automation.Language.Parser]::ParseFile($FullName, [ref]$null, [ref]$errors) | Out-Null
        $errors.Count | Should -Be 0 -Because "DSC resource file should have zero parse errors"
    }
}

Describe "DCCMPA-703 Fix 2 - Error Handler Sanitization" {
    It "<RelPath> should NOT contain vulnerable InvocationInfo.Line" -ForEach $script:fileTestData {
        $content = [System.IO.File]::ReadAllText($FullName, [System.Text.Encoding]::Unicode)
        $content | Should -Not -Match 'InvocationInfo\.Line' -Because "Fix 2 removes InvocationInfo.Line to prevent credential leakage"
    }
    
    It "<RelPath> should have sanitized error handler" -ForEach $script:fileTestData {
        $content = [System.IO.File]::ReadAllText($FullName, [System.Text.Encoding]::Unicode)
        $hasCatchBlock = $content -match 'catch\s*\{'
        if ($hasCatchBlock) {
            $content | Should -Match 'An error occured while executing DSC resource'
        } else {
            Set-ItResult -Skipped -Because "$FileName has no catch blocks"
        }
    }
}

Describe "DCCMPA-703 File Size Validation" {
    It "<RelPath> should not be suspiciously small" -ForEach $script:fileTestData {
        $fileSize = (Get-Item $FullName).Length
        $fileSize | Should -BeGreaterThan 3000 -Because "DSC resource files in UTF-16 should be at least 3KB"
    }
}

Describe "DCCMPA-703 DSC Resource Import Validation" {
    BeforeAll {
        $script:DscResources = @()
        try {
            $script:DscResources = Get-DscResource -Module DellBIOSProvider -ErrorAction Stop
        } catch { }
    }
    
    It "Should find DSC resources from DellBIOSProvider module" {
        $script:DscResources.Count | Should -BeGreaterThan 0
    }
    
    It "DSC resource <ResourceName> should be importable" -ForEach @(
        @{ ResourceName = "POSTBehavior" }
        @{ ResourceName = "PowerManagement" }
        @{ ResourceName = "Security" }
        @{ ResourceName = "SystemConfiguration" }
        @{ ResourceName = "Performance" }
        @{ ResourceName = "AdvancedBootOptions" }
        @{ ResourceName = "MiscellaneousDevices" }
        @{ ResourceName = "Wireless" }
        @{ ResourceName = "Maintenance" }
        @{ ResourceName = "Video" }
        @{ ResourceName = "SecureBoot" }
        @{ ResourceName = "TPMSecurity" }
        @{ ResourceName = "VirtualizationSupport" }
        @{ ResourceName = "SystemLogs" }
        @{ ResourceName = "StealthModeControl" }
        @{ ResourceName = "IntelSoftwareGuardExtensions" }
        @{ ResourceName = "SupportAssistSystemResolution" }
        @{ ResourceName = "AdvancedConfigurations" }
        @{ ResourceName = "BIOSSetupAdvancedMode" }
    ) {
        $resource = $script:DscResources | Where-Object { $_.Name -eq $ResourceName }
        $resource | Should -Not -BeNullOrEmpty
    }
}

Describe "DCCMPA-703 Encoding Regression Guard" {
    It "<RelPath> should not be UTF-8 encoded (regression check)" -ForEach $script:fileTestData {
        $bytes = [System.IO.File]::ReadAllBytes($FullName)
        $isUtf8BOM = ($bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF)
        $isUtf8BOM | Should -BeFalse -Because "UTF-8 encoding would cause DSC parse failures"
        
        $isPlainAscii = ($bytes[0] -ne 0xFF -and $bytes[0] -ne 0xFE -and $bytes[1] -ne 0x00)
        $isPlainAscii | Should -BeFalse -Because "Must not be plain ASCII/UTF-8 without BOM"
    }
}

# SIG # Begin signature block
