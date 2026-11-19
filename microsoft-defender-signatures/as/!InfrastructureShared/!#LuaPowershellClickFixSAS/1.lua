-- Threat: !InfrastructureShared
-- Name: !#Lua:Powershell/ClickFix.SAS
-- Type: 13
-- Includes: BMLuaLib, AppomalyHelpers, LuaFuncHelper
-- MpAttributes: MpPowershellAmsiViaCmdLine

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1.image_path)
if not string.find(l_0_2, "explorer.exe", 1, true) then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_0)
if #l_0_3 < 70 then
  return mp.CLEAN
end
if contains(l_0_3, {".ps1", ".hta"}) then
  return mp.CLEAN
end
local l_0_4 = false
local l_0_5 = 0
local l_0_6 = ""
local l_0_7 = false
if string.find(l_0_3, " %-[eE][ncodemaNCODEMA]*%s+") then
  local l_0_8 = NormalizeCmdline("powershell", l_0_3)
  if l_0_8 == nil then
    return mp.CLEAN
  end
  l_0_6 = string.lower(l_0_8)
  l_0_5 = l_0_5 + 1
  l_0_5 = l_0_5 + str_count_match(l_0_6, {"http"})
  l_0_4 = true
end
if isIEXfound(l_0_6) then
  l_0_5 = l_0_5 + 1
end
l_0_5 = l_0_5 + str_count_match(l_0_6, {
  "mshta.+http",
  "irm ",
  "iwr ",
  " //e:jscript",
  "%.vbs",
  "%)%.downloadstring%(",
  "::frombase64string%(%$",
  "net%.sockets%.tcpclient%(",
  "invoke%-webrequest",
  "invoke%-restmethod",
  ".invoke%(%)",
  "%[system%.text%.encoding%]::utf8",
  "msxml2.xmlhttp",
  "saps%s+",
  "start%-process",
  "start%s+",
  "%-useb",
  "%-usebasicparsing",
  "wscript",
  "cscript",
  "%.shell",
  "%.vbs",
  "wget",
  "curl",
  "conhost.+%-%-headless",
  "net%.webclient",
  "%.content",
  "start%-sleep",
  "%$env:"
})
l_0_5 = l_0_5 + str_count_match(l_0_6, {
  " \226[\128-\191][\128-\191] ",
  " \240[\128-\191][\128-\191][\128-\191] "
})
if l_0_4 == true and 3 <= l_0_5 then
  l_0_7 = true
end
if l_0_4 == false and 2 <= l_0_5 then
  l_0_7 = true
end
local l_0_9, l_0_10 = CommandLineGrader(l_0_3, true, 2)
if l_0_10 and 10 < l_0_9 then
  l_0_7 = true
end
if l_0_7 then
  MpCommon.BmTriggerSig(l_0_0, "LUA:PShellClickFix.SAS", safeJsonSerialize(l_0_10))
  return mp.INFECTED
end
return mp.CLEAN
