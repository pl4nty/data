-- Threat: !InfrastructureShared
-- Name: cfd7939a7416
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0):lower()
if isIEXfound(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
