-- Threat: !InfrastructureShared
-- Name: 5bb362adc01e
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if IsTacticObservedForPid("BM", "schtask_target", true) or IsTacticObservedForParents("BM", "schtask_target", 2) then
  bm_AddRelatedFileFromCommandLine("BM", nil, nil, 2)
  return mp.INFECTED
end
return mp.CLEAN
