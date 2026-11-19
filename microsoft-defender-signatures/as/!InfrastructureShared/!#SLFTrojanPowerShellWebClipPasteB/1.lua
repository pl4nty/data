-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:PowerShell/WebClipPaste.B
-- Type: 13
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: (MpIsWindowsTerminalAMSI | MpPowershellAmsiViaCmdLine)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if l_0_1 == nil or l_0_1 < 16 or 3000 < l_0_1 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2, l_0_3 = pcall(mp.readfile, 0, l_0_1)
mp.readprotection(true)
if not l_0_2 or type(l_0_3) ~= "string" or #l_0_3 < 16 then
  return mp.CLEAN
end
local l_0_4 = l_0_3
if string.find(string.sub(l_0_4, 1, 64), string.char(0), 1, true) then
  local l_0_5, l_0_6 = pcall(mp.utf16to8, l_0_4)
  if l_0_5 and type(l_0_6) == "string" and 0 < #l_0_6 then
    l_0_4 = l_0_6
  end
end
if #l_0_4 < 16 or 3000 < #l_0_4 then
  return mp.CLEAN
end
local l_0_7 = string.lower((string.gsub(l_0_4, "[%^`]", "")))

local function l_0_8(l_1_0, l_1_1)
  for l_1_2 = 1, #l_1_1 do
    if string.find(l_1_0, l_1_1[l_1_2], 1, true) ~= nil then
      return true
    end
  end
  return false
end

local l_0_9 = {
  "iex",
  "invoke-expression",
  "invoke-command",
  "invoke-item",
  "iwr",
  "invoke-webrequest",
  "irm",
  "invoke-restmethod",
  "downloadstring",
  "downloadfile",
  "downloaddata",
  "openread",
  "webclient",
  "new-object net.",
  "new-object system.net",
  "start-bitstransfer",
  "start-process",
  "start-job",
  "saps",
  "scriptblock",
  "-outfile",
  "-usebasicparsing",
  "-executionpolicy",
  "-ep ",
  "-nop",
  "-noprofile",
  "-noninteractive",
  "-windowstyle",
  "-w h",
  "-noexit",
  "-nologo",
  "servicepointmanager",
  "securityprotocol",
  "tls12",
  "frombase64string",
  "-encodedcommand",
  "-enc ",
  "[convert]::",
  "base64",
  "-join",
  "[char]",
  "comspec",
  "cmd /c",
  "cmd.exe /c",
  "for /f",
  "delims=",
  "start /min",
  "/v:on",
  "call %",
  "powershell",
  "pwsh",
  "bitsadmin",
  "certutil",
  "curl",
  "wget",
  "finger",
  "ftp ",
  "tar -x",
  "mshta",
  "regsvr32",
  "rundll32",
  "msiexec",
  "forfiles",
  "wscript",
  "cscript",
  "wmic",
  "conhost",
  "scrobj",
  "scriptrunner",
  "javaws",
  "winrm",
  "$env:temp",
  "%temp%",
  "%appdata%",
  "%localappdata%",
  "\\windows\\temp"
}
if not l_0_8(l_0_7, l_0_9) then
  return mp.CLEAN
end
local l_0_10, l_0_11, l_0_12, l_0_13, l_0_14 = FindRollingQueueContentMatch({
  "IsClickFixCMD"
}, l_0_4)
if not l_0_10 then
  return mp.CLEAN
end
local l_0_15
local l_0_16, l_0_17 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
if l_0_16 and type(l_0_17) == "string" then
  l_0_15 = l_0_17
end
local l_0_18 = tostring(l_0_14) .. "||" .. tostring(l_0_11) .. "||" .. string.sub(tostring(l_0_15 or "-"), 1, 128) .. "||" .. string.sub(tostring(l_0_13 or "-"), 1, 128) .. "||" .. string.sub(tostring(l_0_12), 1, 320) .. "||" .. string.sub(tostring(l_0_4), 1, 320)
set_research_data("WebClipPaste_B", l_0_18, false)
return mp.INFECTED
