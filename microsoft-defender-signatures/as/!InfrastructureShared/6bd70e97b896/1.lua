-- Threat: !InfrastructureShared
-- Name: 6bd70e97b896
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = GetRealPidForScenario("CMDHSTR")
if IsTacticObservedForPid(l_0_0, "proc_search_order_hijack_c") or IsTacticObservedForParents(l_0_0, "proc_search_order_hijack_c", 3) then
  return mp.INFECTED
end
return mp.CLEAN
