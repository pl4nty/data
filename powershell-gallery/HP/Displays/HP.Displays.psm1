#
#  Copyright 2018-2026 HP Development Company, L.P.
#  All Rights Reserved.
#
# NOTICE:  All information contained herein is, and remains the property of HP Development Company, L.P.
#
# The intellectual and technical concepts contained herein are proprietary to HP Development Company, L.P
# and may be covered by U.S. and Foreign Patents, patents in process, and are protected by
# trade secret or copyright law. Dissemination of this information or reproduction of this material
# is strictly forbidden unless prior written permission is obtained from HP Development Company, L.P.

# Load the appropriate DLL based on the PowerShell process architecture

if ($env:PROCESSOR_ARCHITECTURE -eq 'ARM64') {
    $dllPath = Join-Path $PSScriptRoot 'bin\arm64\Release\HP.Displays.dll'
} else {
    $dllPath = Join-Path $PSScriptRoot 'bin\x64\Release\HP.Displays.dll'
}

# Import the architecture-specific binary
Import-Module $dllPath

# SIG # Begin signature block
