-- Threat: !InfrastructureShared
-- Name: 19b39ce73d81
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if type(l_0_0) ~= "string" or l_0_0 == "" then
  return mp.CLEAN
end
bm.add_related_string("PackageSeedContextV3", l_0_0, bm.RelatedStringBMReport)
bm.set_detection_string(l_0_0)
return mp.INFECTED
