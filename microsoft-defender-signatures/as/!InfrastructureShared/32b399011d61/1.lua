-- Threat: !InfrastructureShared
-- Name: 32b399011d61
-- Type: 21

local l_0_0 = this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
bm.add_related_string("SmsScanDetection", l_0_0, bm.RelatedStringBMReport)
return mp.INFECTED
