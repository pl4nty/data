-- Threat: !InfrastructureShared
-- Name: 6d9b39b999ef6
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1, l_0_2 = bm.get_process_relationships(l_0_0.ppid)
for l_0_3, l_0_4 in ipairs(l_0_1) do
  bm.add_related_process(l_0_4.ppid)
  TrackPidAndTechniqueBM(l_0_4.ppid, "T1562.001", "DefenseEvasion")
end
return mp.INFECTED
