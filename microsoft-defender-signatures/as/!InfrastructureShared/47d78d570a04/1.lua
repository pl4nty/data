-- Threat: !InfrastructureShared
-- Name: 47d78d570a04
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil then
  TrackPidAndTechnique(l_0_1.ppid, "T1562.004", "DefenseEvasion")
end
if l_0_0 ~= nil and (IsTacticObservedForPid(l_0_0, "CommandAndControl_RemoteFileCopy") or IsTacticObservedForParents(l_0_0, "CommandAndControl_RemoteFileCopy", 2)) then
  return mp.INFECTED
end
return mp.CLEAN
