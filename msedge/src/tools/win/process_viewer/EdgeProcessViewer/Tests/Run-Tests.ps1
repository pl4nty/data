# Copyright (C) Microsoft Corporation. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

param(
    [string]$ProtectedExecutable = "$env:ProgramFiles\dotnet\dotnet.exe"
)

$ErrorActionPreference = 'Stop'
$sdk = (& dotnet --list-sdks | Select-Object -Last 1)
if ($LASTEXITCODE -ne 0 -or $sdk -notmatch '^(\S+) \[(.+)\]$') {
    throw 'A .NET SDK is required to compile the .NET Framework regression executable.'
}
$compiler = Join-Path $Matches[2] "$($Matches[1])\Roslyn\bincore\csc.dll"
$framework = "${env:ProgramFiles(x86)}\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.8"
if (!(Test-Path -LiteralPath "$framework\mscorlib.dll")) {
    throw 'The .NET Framework 4.8 targeting pack is required.'
}
if (!(Test-Path -LiteralPath $ProtectedExecutable) -or !$ProtectedExecutable.Contains(' ')) {
    throw 'Supply an existing administrator-protected executable path containing a space.'
}

$output = Join-Path ([System.IO.Path]::GetTempPath()) "EdgeProcessViewerTests-$([Guid]::NewGuid().ToString('N'))"
New-Item -ItemType Directory -Path $output | Out-Null
try {
    $production = Join-Path $PSScriptRoot '..\EdgeProcessViewer'
    $arguments = @(
        '/nologo', '/nostdlib+', '/langversion:7.3', '/target:exe',
        '/main:EdgeProcessViewer.PostmortemDebuggerTests', "/out:`"$output\Tests.exe`""
    )
    foreach ($assembly in @('mscorlib', 'System', 'System.Core', 'System.Configuration',
                            'System.Drawing', 'System.Windows.Forms', 'System.Xml',
                            'System.Data', 'System.Deployment', 'System.Net.Http',
                            'System.Xml.Linq', 'Microsoft.CSharp')) {
        $arguments += "/reference:`"$framework\$assembly.dll`""
    }
    [xml]$project = Get-Content -LiteralPath "$production\EdgeProcessViewer.csproj" -Raw
    $sources = @($project.Project.ItemGroup.Compile | Where-Object { $_.Include })
    if ($sources.Count -eq 0) {
        throw 'No production source files found in EdgeProcessViewer.csproj.'
    }
    foreach ($source in $sources) {
        $arguments += "`"$production\$($source.Include)`""
    }
    $arguments += "`"$PSScriptRoot\PostmortemDebuggerTests.cs`""
    $response = Join-Path $output 'compile.rsp'
    $arguments | Set-Content -LiteralPath $response -Encoding UTF8
    & dotnet $compiler /noconfig "@$response"
    if ($LASTEXITCODE -ne 0) { throw 'Production-source regression compilation failed.' }
    & "$output\Tests.exe" $ProtectedExecutable
    if ($LASTEXITCODE -ne 0) { throw 'Postmortem debugger regression tests failed.' }
} finally {
    Remove-Item -LiteralPath $output -Recurse -Force
}
