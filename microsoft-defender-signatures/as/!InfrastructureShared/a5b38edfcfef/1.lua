-- Threat: !InfrastructureShared
-- Name: a5b38edfcfef
-- Type: 21

local l_0_0 = bm.get_process_relationships()
for l_0_1, l_0_2 in ipairs(l_0_0) do
  if l_0_2.reason == bm.RELATIONSHIP_INJECTION then
    return mp.INFECTED
  end
end
return mp.CLEAN
