-- Threat: !InfrastructureShared
-- Name: bdb3ce99f14b
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[3].utf8p1))
end
if string.find(l_0_0, "\\windows kits\\", 1, true) then
  return mp.CLEAN
end
bm.add_related_string("DLLSearchHijacking", tostring(l_0_0), bm.RelatedStringBMReport)
return mp.INFECTED
