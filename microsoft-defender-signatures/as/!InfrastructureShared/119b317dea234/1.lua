-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\119b317dea234\1.luac 

-- params : ...
-- function num : 0
if is_excluded_parent_proc_auto() then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1547.001", "persistence_runkeys_a")
return mp.INFECTED

