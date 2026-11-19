-- Threat: !InfrastructureShared
-- Name: 32b3c03c5a39
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  bm.add_related_string("MDE_Path", this_sigattrlog[1].utf8p2, bm.RelatedStringBMReport)
end
return mp.INFECTED
