Invoke-WebRequest -Uri "https://go.microsoft.com/fwlink/?LinkID=121721&arch=x64" -OutFile "..\mpam-fe.exe"
7z x "..\mpam-fe.exe" -o"..\mpam-fe"

cd ..\mpam-fe
Invoke-WebRequest -Uri "https://github.com/hfiref0x/WDExtract/raw/refs/heads/master/Bin/bin64/wdextract64.exe" -OutFile "..\wdextract64.exe"
Invoke-WebRequest -Uri "https://github.com/hfiref0x/WDExtract/raw/refs/heads/master/Bin/bin64/zlibwapi.dll" -OutFile "..\zlibwapi.dll"
..\wdextract64.exe mpasbase.vdm
..\wdextract64.exe mpasdlta.vdm
ls
..\data\extract_sig_static.exe . mpasbase.vdm.extracted mpasdlta.vdm.extracted
ls

Invoke-WebRequest -Uri "https://github.com/hongson11698/defender-database-extract/raw/refs/heads/master/lua_sig_parser_decompile.py" -OutFile "..\lua_sig_parser_decompile.py"
python ..\lua_sig_parser_decompile.py lua_standalone_sig_mpasbase.vdm.extracted.csv

Invoke-WebRequest -Uri "https://github.com/hongson11698/defender-database-extract/raw/refs/heads/master/luadec.exe" -OutFile "..\luadec.exe"
Get-ChildItem .\lua -Recurse -Filter *_luac | ForEach-Object {
  ..\luadec.exe $_.FullName > "$($_.FullName).lua"
  $_
} | Remove-Item
Remove-Item ..\data\microsoft-defender-signatures -ErrorAction Ignore
Move-Item .\lua ..\data\microsoft-defender-signatures
