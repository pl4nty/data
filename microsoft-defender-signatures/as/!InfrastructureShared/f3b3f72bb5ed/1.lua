-- Threat: !InfrastructureShared
-- Name: f3b3f72bb5ed
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[1].utf8p2)
  bm.add_related_string("process_cmdline", l_0_1, bm.RelatedStringBMReport)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  bm.add_related_string("filemetadata", l_0_0, bm.RelatedStringBMReport)
  bm.add_related_file(l_0_0)
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[4].utf8p2)
end
if l_0_2 ~= nil then
  bm.add_related_string("parent_cmdline", l_0_2, bm.RelatedStringBMReport)
end
local l_0_3, l_0_4 = bm.get_process_relationships()
for l_0_5, l_0_6 in ipairs(l_0_4) do
  bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_6.ppid)
end
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
