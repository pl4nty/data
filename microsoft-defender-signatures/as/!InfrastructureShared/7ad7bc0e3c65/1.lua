-- Threat: !InfrastructureShared
-- Name: 7ad7bc0e3c65
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
