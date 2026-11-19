-- Threat: !InfrastructureShared
-- Name: 100b38d5fac15
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
bm.add_related_string("file_metadata", l_0_0, bm.RelatedStringBMReport)
reportRelatedBmHits()
addRelatedProcess()
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_2) do
  bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_4.ppid)
end
return mp.INFECTED
