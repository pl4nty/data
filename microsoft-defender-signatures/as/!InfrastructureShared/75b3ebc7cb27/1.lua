-- Threat: !InfrastructureShared
-- Name: 75b3ebc7cb27
-- Type: 21

if bm.GetSignatureMatchDuration() > 12000000000 then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
bm.add_related_string("ProcessCreateParam", l_0_0, bm.RelatedStringBMReport)
return mp.INFECTED
