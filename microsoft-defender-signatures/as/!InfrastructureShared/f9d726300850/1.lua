-- Threat: !InfrastructureShared
-- Name: f9d726300850
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_2 = mp.GetScannedPPID()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4, l_0_5 = MpCommon.StringRegExpSearch("(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+", l_0_3)
if not l_0_4 then
  return mp.CLEAN
end
local l_0_6 = false
local l_0_7 = 0
local l_0_8 = ""
if string.find(l_0_3, " %-[eE][ncodemaNCODEMA]*%s+") then
  local l_0_9 = NormalizeCmdline("powershell", l_0_3)
  if l_0_9 == nil then
    return mp.CLEAN
  end
  l_0_8 = string.lower(l_0_9)
  l_0_7 = l_0_7 + 1
  l_0_7 = l_0_7 + str_count_match(l_0_8, {"http"})
  l_0_6 = true
end
if isIEXfound(l_0_8) then
  l_0_7 = l_0_7 + 1
end
l_0_7 = l_0_7 + str_count_match(l_0_8, {
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
  "%$env:"
})
l_0_7 = l_0_7 + str_count_match(l_0_8, {
  " \226[\128-\191][\128-\191] ",
  " \240[\128-\191][\128-\191][\128-\191] "
})
if l_0_6 == true and 3 <= l_0_7 then
  return mp.INFECTED
elseif l_0_6 == false and 2 <= l_0_7 then
  return mp.INFECTED
end
return mp.CLEAN
