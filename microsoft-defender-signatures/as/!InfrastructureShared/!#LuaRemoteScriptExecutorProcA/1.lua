-- Threat: !InfrastructureShared
-- Name: !#Lua:RemoteScriptExecutorProc.A
-- Type: 24
-- Includes: TechniqueTracker
-- MpAttributes: RPF:TopLevelFile & Lua:AmsiAppContextDataPresent

local l_0_0 = GetRealPidForScenario("AMSI")
if l_0_0 == nil then
  l_0_0 = GetRealPidForScenario("RTP")
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = GetTacticsTableForPid(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1.wmi_childproc or l_0_1.wsmprovhost_childproc or l_0_1.winrshost_childproc or l_0_1.exec_remotedroppedscript_a or l_0_1.exec_remotedroppedscript_b or l_0_1.ExecRemoteDroppedExe or l_0_1.exec_from_remoteshare then
  return mp.INFECTED
end
if mp.get_mpattribute("Lua:TT:DetectionThresholdMet") and (IsTacticObservedForParents(l_0_0, "exec_from_remoteshare", 2) or IsTacticObservedForParents(l_0_0, "remoteservice-target", 2)) then
  return mp.INFECTED
end
return mp.CLEAN
