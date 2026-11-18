-- Threat: !InfrastructureShared
-- Name: 124b3be9d1312
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if l_0_3.reason == bm.RELATIONSHIP_INJECTION then
    bm.add_threat_process(l_0_3.ppid)
  end
end
AddResearchData("BM", true)
return mp.INFECTED
