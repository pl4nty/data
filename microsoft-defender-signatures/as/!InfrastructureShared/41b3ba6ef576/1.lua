-- Threat: !InfrastructureShared
-- Name: 41b3ba6ef576
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  bm.add_related_string("vname", l_0_0, bm.RelatedStringBMReport)
end
return mp.INFECTED
