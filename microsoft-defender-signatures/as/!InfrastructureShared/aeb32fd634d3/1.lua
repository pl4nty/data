-- Threat: !InfrastructureShared
-- Name: aeb32fd634d3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
TrackPidAndTechniqueBM(l_0_0.ppid, "T1562.001", "mptamper-titokensteal")
local l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_1 = this_sigattrlog[1].p1
  l_0_2 = this_sigattrlog[1].p2
end
bm.add_related_string("OldName", l_0_1, bm.RelatedStringBMReport)
bm.add_related_string("NewName", l_0_2, bm.RelatedStringBMReport)
return mp.INFECTED
