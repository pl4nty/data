-- Threat: !InfrastructureShared
-- Name: e1b34550774b
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].ppid
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetParentProcInfo(l_0_0)
  if not isParentPackageManager(l_0_0) then
    TrackPidAndTechniqueBM(l_0_0, "T1562.001", "DefenseEvasion")
    if IsTacticObservedForPid(l_0_0, "CommandAndControl_RemoteFileCopy") then
      return mp.INFECTED
    end
    if l_0_1 ~= nil and IsTacticObservedForPid(l_0_1.ppid, "CommandAndControl_RemoteFileCopy") then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
