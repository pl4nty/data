-- Threat: !InfrastructureShared
-- Name: 87d7bd00d9d8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0):lower()
local l_0_2 = {"payload", "flipper"}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
if isIEXfound(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
