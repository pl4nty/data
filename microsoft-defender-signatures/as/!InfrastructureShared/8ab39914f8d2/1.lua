-- Threat: !InfrastructureShared
-- Name: 8ab39914f8d2
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if l_0_0 ~= nil then
  bm.add_related_string("SuspFileCreateG", tostring(l_0_0), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
