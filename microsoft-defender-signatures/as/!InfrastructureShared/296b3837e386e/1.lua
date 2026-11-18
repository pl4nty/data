-- Threat: !InfrastructureShared
-- Name: 296b3837e386e
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_3.ppid)
end
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
