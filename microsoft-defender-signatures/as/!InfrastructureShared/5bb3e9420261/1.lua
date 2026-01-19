-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb3e9420261\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) or isnull(l_0_0.ppid) then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ppid
if IsTacticObservedForPid(l_0_1, "schtask_target", true) or IsTacticObservedForParents(l_0_1, "schtask_target", 3) then
  bm_AddRelatedFileFromCommandLine("BM", nil, nil, 2)
  return mp.INFECTED
end
return mp.CLEAN

