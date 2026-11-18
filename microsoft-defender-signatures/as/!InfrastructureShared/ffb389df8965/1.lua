-- Threat: !InfrastructureShared
-- Name: ffb389df8965
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[1].utf8p2))
end
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "\\windows\\system32\\", 1, true) or string.find(l_0_0, "\\windows\\syswow64\\", 1, true) then
  return mp.CLEAN
end
bm.add_related_string("SuspMMCLaunch", tostring(l_0_0), bm.RelatedStringBMReport)
return mp.INFECTED
