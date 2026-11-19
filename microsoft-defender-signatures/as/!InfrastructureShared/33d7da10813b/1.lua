-- Threat: !InfrastructureShared
-- Name: 33d7da10813b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1.image_path)
if l_0_2 == nil then
  return mp.CLEAN
end
if not l_0_2:find("\\explorer.exe") then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_0)
if not l_0_3 or #l_0_3 <= 50 then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
local l_0_4 = "[\\.\\-]replace[\\s(]+['\"]([^'\"])+['\"]"
local l_0_5, l_0_6 = MpCommon.StringRegExpSearch(l_0_4, l_0_3)
if not l_0_5 then
  return mp.CLEAN
end
local l_0_7, l_0_8 = string.gsub(l_0_3, "%" .. l_0_6, "")
if not l_0_7 or not l_0_8 then
  return mp.CLEAN
end
if l_0_8 and tonumber(l_0_8) < 10 then
  return mp.CLEAN
end
if contains(l_0_7, {
  "curl",
  "iex",
  "http",
  "invoke-expression",
  "mshta",
  "msiexec"
}) then
  return mp.INFECTED
end
return mp.CLEAN
