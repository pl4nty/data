-- Threat: !InfrastructureShared
-- Name: 37d7eaa5d5b0
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = GetRealPidForScenario("CMDHSTR")
if IsTacticObservedForPid(l_0_0, "bas_tool_safebreach_process") or IsTacticObservedForParents(l_0_0, "bas_tool_safebreach_process", 4) then
  return mp.INFECTED
end
return mp.CLEAN
