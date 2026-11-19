-- Threat: !InfrastructureShared
-- Name: 73b3e6c788d3
-- Type: 21
-- Includes: TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1036", "masqueraded_renpy_process")
local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.ppid then
  bm.trigger_sig_target_propagate("MasqueradedRenPyProcessChain", "MasqueradedRenPyProcessChain", l_0_0.ppid)
end
return mp.INFECTED
