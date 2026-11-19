-- Threat: !InfrastructureShared
-- Name: 4bd70e926eed
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0 = GetRealPidForScenario("CMDHSTR")
if l_0_0 == nil then
  return mp.CLEAN
end
if IsPidExcluded(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.GetScannedPPID()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
if IsDetectionThresholdMet(l_0_0) or IsTacticObservedForParents(l_0_0, "remoteservice-target", 3) or IsTacticObservedForParents(l_0_0, "exec_remotely_dropped_unsigned", 3) or IsTacticObservedForParents(l_0_0, "processinjection_target", 3) or IsTacticObservedGlobal("susp_ransomware") then
  AppendToRollingQueue("BruteForceNetUse", l_0_2, l_0_1, 3600)
  local l_0_3 = GetRollingQueueCount("BruteForceNetUse")
  if 3 < l_0_3 then
    return mp.INFECTED
  end
end
return mp.CLEAN
