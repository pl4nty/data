-- Threat: !InfrastructureShared
-- Name: 6fd7c35ed4a4
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or #l_0_1 <= 20 then
  return mp.CLEAN
end
l_0_1 = string.gsub(string.lower(l_0_1), "[%'\"]%)?%+%(?[%'\"]", "")
local l_0_2 = {
  "verification"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
return mp.INFECTED
