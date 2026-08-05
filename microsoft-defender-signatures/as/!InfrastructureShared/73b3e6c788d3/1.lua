-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b3e6c788d3\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1036", "masqueraded_renpy_process")
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 and l_0_0.ppid then
  (bm.trigger_sig_target_propagate)("MasqueradedRenPyProcessChain", "MasqueradedRenPyProcessChain", l_0_0.ppid)
end
return mp.INFECTED

