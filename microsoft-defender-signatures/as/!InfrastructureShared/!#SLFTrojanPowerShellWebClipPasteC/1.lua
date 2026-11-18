-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:PowerShell/WebClipPaste.C
-- Type: 13
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: (MpIsWindowsTerminalAMSI | MpPowershellAmsiViaCmdLine)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if l_0_1 == nil or l_0_1 < 100 or 16384 < l_0_1 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2, l_0_3 = pcall(mp.readfile, 0, l_0_1)
mp.readprotection(true)
if not l_0_2 or type(l_0_3) ~= "string" or #l_0_3 < 100 then
  return mp.CLEAN
end
local l_0_4 = l_0_3
if string.find(string.sub(l_0_4, 1, 64), string.char(0), 1, true) then
  local l_0_5, l_0_6 = pcall(mp.utf16to8, l_0_4)
  if l_0_5 and type(l_0_6) == "string" and 0 < #l_0_6 then
    l_0_4 = l_0_6
  end
end
if #l_0_4 < 100 or 16384 < #l_0_4 then
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
local l_0_10 = {
  minCandidateLength = 100,
  minKeyLength = 200,
  maxKeyLength = 3000,
  keyInCandidateMinLength = 150,
  candidateInKeyMinLength = 100,
  distinctiveMinLength = 40,
  distinctiveBlobMinLength = 64
}
local l_0_11, l_0_12, l_0_13, l_0_14, l_0_15 = FindRollingQueueContentMatch({
  "IsClickFixCMD_Malicious"
}, l_0_4, l_0_10)
if not l_0_11 then
  return mp.CLEAN
end

local function l_0_16(l_2_0)
  local l_2_1, l_2_2 = string.match(l_2_0, "^%s*(.-)%s*|%s*([%a%-]+)%s*;?%s*$")
  if l_2_2 ~= "iex" and l_2_2 ~= "invoke-expression" then
    l_2_1 = string.match(l_2_0, "^%s*iex%s*%((.-)%)%s*;?%s*$") or string.match(l_2_0, "^%s*invoke%-expression%s*%((.-)%)%s*;?%s*$")
  end
  if l_2_1 == nil then
    return false
  end
  l_2_1 = string.match(l_2_1, "^%s*%((.-)%)%s*$") or l_2_1
  local l_2_3 = string.match(l_2_1, "^%s*irm%s+(.+)$") or string.match(l_2_1, "^%s*invoke%-restmethod%s+(.+)$")
  if l_2_3 == nil then
    return false
  end
  l_2_3 = string.match(l_2_3, "^%s*(.-)%s*$")
  local l_2_4, l_2_5, l_2_6 = string.match(l_2_3, "^(['\"]?)(https?://[^%s'\"`$;|(){}<>#%^]+)(['\"]?)$")
  return l_2_5 ~= nil and l_2_4 == l_2_6
end

if l_0_15 == "a_clip_in_buf" or l_0_15 == "b_buf_in_clip" then
  local l_0_17 = string.match(string.lower(l_0_4), "^%s*(.-)%s*$")
  local l_0_18 = string.match(string.lower(l_0_13), "^%s*(.-)%s*$")
  l_0_17 = string.gsub(l_0_17, "%s+", " ")
  l_0_18 = string.gsub(l_0_18, "%s+", " ")
  local l_0_20 = 150 <= #l_0_18 and string.find(l_0_17, l_0_18, 1, true) or 100 <= #l_0_17 and string.find(l_0_18, l_0_17, 1, true)
  if l_0_20 and l_0_16(string.lower(l_0_4)) then
    local l_0_21 = GetRollingQueueKeyValue("IsClickFixCMD_ConfirmedMalicious", l_0_13)
    if type(l_0_21) == "string" and l_0_21 == l_0_14 then
      mp.set_mpattribute("Lua:WebClipPasteC:ConfirmedRemoteExec")
    end
  end
end
local l_0_22
local l_0_23, l_0_24 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
if l_0_23 and type(l_0_24) == "string" then
  l_0_22 = l_0_24
end
local l_0_25 = tostring(l_0_15) .. "||" .. tostring(l_0_12) .. "||" .. string.sub(tostring(l_0_22 or "-"), 1, 128) .. "||" .. string.sub(tostring(l_0_14 or "-"), 1, 128) .. "||" .. string.sub(tostring(l_0_13), 1, 320) .. "||" .. string.sub(tostring(l_0_4), 1, 320)
set_research_data("WebClipPaste_C", l_0_25, false)
return mp.INFECTED
