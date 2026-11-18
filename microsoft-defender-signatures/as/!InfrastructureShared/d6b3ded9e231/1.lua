-- Threat: !InfrastructureShared
-- Name: d6b3ded9e231
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_3.ppid)
end
return mp.INFECTED
