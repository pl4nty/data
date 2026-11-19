-- Threat: !InfrastructureShared
-- Name: 32b391f59919
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local l_0_0 = this_sigattrlog[1].utf8p2
  bm.add_related_string("AppliedThroughPolicy", l_0_0, bm.RelatedStringBMReport)
end
return mp.INFECTED
