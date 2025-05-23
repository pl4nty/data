Invoke-WebRequest -Uri "https://go.microsoft.com/fwlink/?LinkID=121721&arch=x64" -OutFile "..\mpam-fe.exe"
7z x "..\mpam-fe.exe" -o"..\mpam-fe"

cd ..\mpam-fe
Invoke-WebRequest -Uri "https://github.com/hfiref0x/WDExtract/raw/refs/heads/master/Bin/bin64/wdextract64.exe" -OutFile "..\wdextract64.exe"
Invoke-WebRequest -Uri "https://github.com/hfiref0x/WDExtract/raw/refs/heads/master/Bin/bin64/zlibwapi.dll" -OutFile "..\zlibwapi.dll"
Get-ChildItem .
..\wdextract64.exe mpasbase.vdm
..\wdextract64.exe mpasdlta.vdm
..\wdextract64.exe mpavbase.vdm
..\wdextract64.exe mpavdlta.vdm

Invoke-WebRequest -Uri "https://github.com/hongson11698/defender-database-extract/raw/refs/heads/master/extract_sig.cpp" -OutFile "..\extract_sig.cpp"
& "$env:ProgramFiles\Microsoft Visual Studio\2022\Enterprise\Common7\Tools\Launch-VsDevShell.ps1" -Arch amd64
cl /std:c++17 /EHsc ..\extract_sig.cpp
.\extract_sig.exe . mpasbase.vdm.extracted mpasdlta.vdm.extracted
.\extract_sig.exe . mpavbase.vdm.extracted mpavdlta.vdm.extracted

Invoke-WebRequest -Uri "https://github.com/hongson11698/defender-database-extract/raw/refs/heads/master/luadec.exe" -OutFile "luadec.exe"
'as', 'av' | ForEach-Object {
  python ..\data\microsoft_defender_lua_sig_parser_decompile.py "lua_standalone_sig_mp$($_)base.vdm.extracted.csv"
  # Get-ChildItem .\lua -Recurse -Filter *_luac | Remove-Item
  Remove-Item ..\data\microsoft-defender-signatures\$_ -Recurse -ErrorAction Ignore
  Move-Item .\lua ..\data\microsoft-defender-signatures\$_
}
