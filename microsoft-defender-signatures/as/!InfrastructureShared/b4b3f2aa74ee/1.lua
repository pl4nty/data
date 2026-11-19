-- Threat: !InfrastructureShared
-- Name: b4b3f2aa74ee
-- Type: 21

local l_0_0
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[5].utf8p1))
end
if string.find(l_0_0, "\\usoshared\\", 1, true) then
  bm.add_related_string("SuspFW11", tostring(l_0_0), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
