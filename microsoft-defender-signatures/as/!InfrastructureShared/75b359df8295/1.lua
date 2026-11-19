-- Threat: !InfrastructureShared
-- Name: 75b359df8295
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  bm.add_related_process(l_0_3.ppid)
end
return mp.INFECTED
