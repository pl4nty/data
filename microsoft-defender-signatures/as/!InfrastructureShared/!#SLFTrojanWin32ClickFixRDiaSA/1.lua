-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/ClickFixRDia.SA
-- Type: 13
-- Includes: BMLuaLib, ResearchData
-- MpAttributes: MpIsRunDialogAmsiScan

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 == 0 or 700 < l_0_0 then
  return mp.CLEAN
end
if mp.HEADERPAGE_SZ < 10 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
l_0_1 = mp.utf16to8(l_0_1)
if 512 < #l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3 = {
  "powershell",
  "pwsh",
  "cmd.exe",
  "cmd /c",
  "cmd /k",
  "cmd /r",
  "cmd.exe /",
  "mshta",
  "mshta.exe",
  "wscript",
  "cscript",
  "rundll32",
  "regsvr32",
  "msiexec",
  "curl.exe",
  "certutil",
  "bitsadmin",
  "wmic",
  "forfiles",
  "conhost",
  "hh.exe",
  "ieexec",
  "installutil",
  "msbuild",
  "regasm",
  "regsvcs",
  "psexec",
  "cmstp",
  "ftp.exe",
  "tftp.exe",
  "wsl.exe",
  "wsl ",
  "pcalua",
  "scriptrunner"
}
if not contains(l_0_2, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {
  "iex",
  "invoke-expression",
  "invoke-webrequest",
  "iwr",
  "invoke-restmethod",
  "irm ",
  "downloadstring",
  "downloadfile",
  "downloaddata",
  "net.webclient",
  "system.net.webclient",
  "frombase64string",
  "convert]::from",
  "[convert]::from",
  "-encodedcommand",
  " -enc ",
  " -e ",
  "-executionpolicy",
  "-exec bypass",
  " bypass",
  "-nop",
  "-noprofile",
  "-noninteractive",
  "-noni",
  "-windowstyle hidden",
  "-w hidden",
  " -w h",
  "-wi h",
  "-wi 1",
  "start-process",
  "start-bitstransfer",
  "bitstransfer",
  "wget ",
  "http://",
  "https://",
  "ftp://",
  "-useb",
  "-usebasicparsing",
  "useb ",
  "[scriptblock]",
  "::create(",
  "$env:",
  "$host.",
  "[ref].assembly",
  "add-mppreference",
  "set-mppreference",
  "set-executionpolicy",
  "amsiutils",
  "amsiinitfailed",
  "amsicontext",
  "saps ",
  "sal ",
  "sv ",
  "invoke-command",
  "-decode",
  "/decode",
  "echo ",
  " | cmd",
  " | powershell",
  "| pwsh",
  "hta:",
  "javascript:",
  "$env:temp",
  "shinoclickfix"
}
if not contains(l_0_2, l_0_4) then
  return mp.CLEAN
end
set_research_data("ClickFixRDia_SA", tostring(l_0_1), false)
return mp.INFECTED
