-- Threat: !InfrastructureShared
-- Name: 87b395c6925a
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[3].utf8p1))
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
bm.add_related_string("OnedriveDLLSideload", tostring(l_0_0), bm.RelatedStringBMReport)
return mp.INFECTED
