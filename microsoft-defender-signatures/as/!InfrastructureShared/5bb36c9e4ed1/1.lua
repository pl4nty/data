-- Threat: !InfrastructureShared
-- Name: 5bb36c9e4ed1
-- Type: 21

local l_0_0 = ""
local l_0_1 = ""
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 and this_sigattrlog[1].utf8p2 then
  l_0_0 = tostring(this_sigattrlog[1].utf8p1)
  l_0_1 = tostring(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 and this_sigattrlog[2].utf8p2 then
  l_0_0 = tostring(this_sigattrlog[2].utf8p1)
  l_0_1 = tostring(this_sigattrlog[2].utf8p2)
end
if not l_0_1 then
  return mp.CLEAN
end
if not l_0_0 then
  return mp.CLEAN
end
bm.add_related_string(l_0_0, l_0_1, bm.RelatedStringBMReport)
return mp.INFECTED
