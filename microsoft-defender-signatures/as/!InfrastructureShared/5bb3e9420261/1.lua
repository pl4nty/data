-- Threat: !InfrastructureShared
-- Name: 5bb3e9420261
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if isnull(l_0_0) or isnull(l_0_0.ppid) then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ppid
if IsTacticObservedForPid(l_0_1, "schtask_target", true) or IsTacticObservedForParents(l_0_1, "schtask_target", 3) then
  bm_AddRelatedFileFromCommandLine("BM", nil, nil, 2)
  return mp.INFECTED
end
return mp.CLEAN
