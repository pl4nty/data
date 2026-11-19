-- Threat: !InfrastructureShared
-- Name: 8eb3017a6323
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if IsTacticObservedForPid("BM", "schtask_target", true) or IsTacticObservedForParents("BM", "schtask_target", 3) then
  bm_AddRelatedFileFromCommandLine("BM", nil, nil, 2)
  return mp.INFECTED
end
return mp.CLEAN
