-- Threat: !InfrastructureShared
-- Name: 67d73fbd67ad
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local function l_0_0(l_1_0)
  if l_1_0 == nil then
    return false
  end
  return checkParentCmdline(l_1_0, {
    {
      "/opt/microsoft/mdatp/sbin/wdavdaemon",
      ""
    },
    {
      "",
      "python3 -u bin/WALinuxAgent"
    }
  }, 3)
end

local l_0_1 = mp.GetScannedPPID()
if isParentPackageManager(l_0_1) or l_0_0(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 ~= nil then
  TrackPidAndTechnique(l_0_2.ppid, "T1562.004", "DefenseEvasion")
end
if l_0_1 ~= nil and (IsTacticObservedForPid(l_0_1, "CommandAndControl_RemoteFileCopy") or IsTacticObservedForParents(l_0_1, "CommandAndControl_RemoteFileCopy", 2)) then
  return mp.INFECTED
end
return mp.CLEAN
