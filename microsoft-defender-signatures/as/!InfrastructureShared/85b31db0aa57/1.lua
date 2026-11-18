-- Threat: !InfrastructureShared
-- Name: 85b31db0aa57
-- Type: 21
-- Includes: BMLuaLib

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
bm_AddRelatedFileFromCommandLine(l_0_0)
bm.add_related_string("ProcessCreateParam", l_0_0, bm.RelatedStringBMReport)
return mp.INFECTED
