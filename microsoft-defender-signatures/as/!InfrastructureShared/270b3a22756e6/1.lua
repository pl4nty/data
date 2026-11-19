-- Threat: !InfrastructureShared
-- Name: 270b3a22756e6
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[12].utf8p1))
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
bm.add_related_string("DLL", tostring(l_0_0), bm.RelatedStringBMReport)
return mp.INFECTED
