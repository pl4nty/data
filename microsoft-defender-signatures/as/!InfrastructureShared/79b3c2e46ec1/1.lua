-- Threat: !InfrastructureShared
-- Name: 79b3c2e46ec1
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  bm.add_related_process(l_0_3.ppid)
  TrackPidAndTechniqueBM(l_0_3.ppid, "T1548.003", "PrivilegeEscalation")
end
return mp.INFECTED
