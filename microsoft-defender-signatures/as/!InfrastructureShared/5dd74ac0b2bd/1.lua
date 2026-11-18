-- Threat: !InfrastructureShared
-- Name: 5dd74ac0b2bd
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if not string.find(l_0_1, "msxsl", 1, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("CMDHSTR", "T1220", "SuspMsxslExec")
return mp.INFECTED
