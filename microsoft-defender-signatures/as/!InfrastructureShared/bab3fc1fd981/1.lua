-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bab3fc1fd981\1.luac 

-- params : ...
-- function num : 0
if IsTacticObservedForPid("BM", "schtask_target", true) or IsTacticObservedForParents("BM", "schtask_target", 3) then
  bm_AddRelatedFileFromCommandLine("BM", nil, nil, 2)
  return mp.INFECTED
end
return mp.CLEAN

