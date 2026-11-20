-- Threat: !InfrastructureShared
-- Name: 7db39f5c265b
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
  bm.add_related_string("vname", l_0_0, bm.RelatedStringBMReport)
end
return mp.INFECTED
