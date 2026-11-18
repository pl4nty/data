-- Threat: !InfrastructureShared
-- Name: 140b3e9ec6a5f
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  l_0_1 = string.lower(this_sigattrlog[2].utf8p2)
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[3].utf8p1)
  l_0_3 = string.lower(this_sigattrlog[3].utf8p2)
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_4 = string.lower(this_sigattrlog[4].utf8p1)
  l_0_5 = string.lower(this_sigattrlog[4].utf8p2)
end
if l_0_0 then
  bm.add_related_string("link1_s", tostring(l_0_0), bm.RelatedStringBMReport)
end
if l_0_1 then
  bm.add_related_string("link1_d", tostring(l_0_1), bm.RelatedStringBMReport)
end
if l_0_2 then
  bm.add_related_string("link2_s", tostring(l_0_2), bm.RelatedStringBMReport)
end
if l_0_3 then
  bm.add_related_string("link2_d", tostring(l_0_3), bm.RelatedStringBMReport)
end
if l_0_4 then
  bm.add_related_string("target_proc", tostring(l_0_4), bm.RelatedStringBMReport)
end
if l_0_5 then
  bm.add_related_string("mask", tostring(l_0_5), bm.RelatedStringBMReport)
end
return mp.INFECTED
