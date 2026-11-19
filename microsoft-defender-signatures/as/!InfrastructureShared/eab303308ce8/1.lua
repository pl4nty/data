-- Threat: !InfrastructureShared
-- Name: eab303308ce8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[4].utf8p2)
  bm.add_related_string("parent_cmdline", l_0_1, bm.RelatedStringBMReport)
end
if l_0_0 ~= nil then
  bm.add_related_string("process_cmdline", l_0_0, bm.RelatedStringBMReport)
end
local l_0_2, l_0_3 = bm.get_process_relationships()
for l_0_4, l_0_5 in ipairs(l_0_3) do
  bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_5.ppid)
end
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
