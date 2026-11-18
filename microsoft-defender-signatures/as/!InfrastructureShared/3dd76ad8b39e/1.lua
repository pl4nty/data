-- Threat: !InfrastructureShared
-- Name: 3dd76ad8b39e
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = GetRealPidForScenario("CMDHSTR")
if IsTacticObservedForPid(l_0_0, "bas_tool_safebreach_process") or IsTacticObservedForParents(l_0_0, "bas_tool_safebreach_process", 4) then
  return mp.INFECTED
end
return mp.CLEAN
