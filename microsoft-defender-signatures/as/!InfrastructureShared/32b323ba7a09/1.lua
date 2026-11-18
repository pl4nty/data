-- Threat: !InfrastructureShared
-- Name: 32b323ba7a09
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  bm.add_related_string("Evidence", this_sigattrlog[1].utf8p2, bm.RelatedStringBMReport)
  bm.add_related_string("DetectionName", this_sigattrlog[1].utf8p1, bm.RelatedStringBMReport)
  bm.add_related_string("EventTime", this_sigattrlog[1].timestamp, bm.RelatedStringBMReport)
end
return mp.INFECTED
