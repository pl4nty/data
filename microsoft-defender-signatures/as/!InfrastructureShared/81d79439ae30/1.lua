-- Threat: !InfrastructureShared
-- Name: 81d79439ae30
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if type(l_0_0) ~= "string" or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if type(l_0_1) ~= "string" or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2, l_0_3 = string.match(l_0_1, "^%s*\"([^\"]+)\"%s+(.*)$")
if l_0_2 == nil then
  l_0_2, l_0_3 = string.match(l_0_1, "^%s*([^%s\"]+)%s+(.*)$")
end
if l_0_2 == nil or l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.match(l_0_2, "[^\\/]+$")
if l_0_4 == nil then
  return mp.CLEAN
end
l_0_4 = string.gsub(l_0_4, "%.exe$", "")

local function l_0_5(l_1_0)
  return string.find(l_0_3, l_1_0, 1, true) ~= nil
end

local function l_0_6(l_2_0)
  return string.find(l_0_3, "%f[%w_]" .. l_2_0 .. "%f[^%w_]") ~= nil
end

local l_0_7 = MpCommon.StringRegExpSearch("(?:^|[^a-z0-9_])(?:artx|artex|art[0-9]+)[a-z0-9_-]*", l_0_3)
local l_0_8 = l_0_5("hklm\\sam") or l_0_5("hklm\\system") or l_0_5("hklm\\security") or l_0_5("hkey_local_machine\\sam") or l_0_5("hkey_local_machine\\system") or l_0_5("hkey_local_machine\\security")
if l_0_4 == "reg" and l_0_6("save") and l_0_8 and l_0_7 then
  return mp.INFECTED
end
if l_0_4 == "esentutl" and l_0_5("\\system32\\config\\system") and l_0_7 then
  return mp.INFECTED
end
if l_0_4 == "appcmd" and l_0_6("set") and l_0_7 then
  return mp.INFECTED
end
if l_0_4 == "w3wp" and l_0_7 then
  return mp.LOWFI
end
if l_0_4 == "certutil" and l_0_6("decode") and l_0_7 then
  return mp.INFECTED
end
if (l_0_4 == "powershell" or l_0_4 == "pwsh") and l_0_6("executionpolicy") and l_0_6("bypass") and l_0_5(".ps1") and l_0_7 then
  return mp.INFECTED
end
mp.set_mpattribute("OtherArtexKeyWordCommands_ST01")
return mp.CLEAN
