-- Threat: !InfrastructureShared
-- Name: 2efb3810fa614
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[15].matched and this_sigattrlog[15].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[15].utf8p1))
end
if l_0_0 == nil then
  return mp.CLEAN
end
bm.add_related_string("SuspSearchOrderExpl_B", tostring(l_0_0), bm.RelatedStringBMReport)
return mp.INFECTED
