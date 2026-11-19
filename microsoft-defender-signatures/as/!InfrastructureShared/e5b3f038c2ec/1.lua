-- Threat: !InfrastructureShared
-- Name: e5b3f038c2ec
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if is_excluded_parent_proc_auto() then
  return mp.CLEAN
end
local l_0_0 = GetRealPidForScenario("BM")
AddResearchData(l_0_0, true)
if IsTacticObservedForPid(l_0_0, "ntdsexfil") and IsTechniqueObservedForPid(l_0_0, "T1140") then
  return mp.INFECTED
end
if IsTechniqueObservedForPid(l_0_0, "T1047") or IsTechniqueObservedForPid(l_0_0, "T1021.006") then
  return mp.INFECTED
end
if IsDetectionThresholdMet(l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
