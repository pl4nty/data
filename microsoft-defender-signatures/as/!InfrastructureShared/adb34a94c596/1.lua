-- Threat: !InfrastructureShared
-- Name: adb34a94c596
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil and this_sigattrlog[1].utf8p2 ~= "" then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_2 = ""
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" then
  l_0_1 = this_sigattrlog[2].utf8p2
  l_0_2 = "SuspiciousPathMatch: " .. l_0_1
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  l_0_1 = this_sigattrlog[3].utf8p2
  l_0_2 = "SuspiciousPathNameMatch: " .. l_0_1
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil and this_sigattrlog[4].utf8p2 ~= "" then
  l_0_1 = this_sigattrlog[4].utf8p2
  l_0_2 = "SuspiciousHighConfMatch: " .. l_0_1
end
if l_0_0 ~= nil and l_0_0 ~= "" and l_0_1 ~= nil and l_0_1 ~= "" and l_0_2 ~= "" then
  bm.add_related_string("SuspAttrMatch", l_0_0, bm.RelatedStringBMReport)
  bm.add_related_string("SuspMatchType", l_0_2, bm.RelatedStringBMReport)
  bm.add_related_file(l_0_1)
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
