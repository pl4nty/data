-- Threat: !InfrastructureShared
-- Name: d6b36e1e35e8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_3.ppid)
end
local l_0_4 = bm.get_imagepath()
if l_0_4 ~= "" and l_0_4 ~= nil and check_common_process_linux(l_0_4) == false then
  bm.add_threat_file(l_0_4)
end
return mp.INFECTED
