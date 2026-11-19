-- Threat: !InfrastructureShared
-- Name: 200b3157a0fe6
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
local l_0_1
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
if this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  l_0_1 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[12].utf8p1))
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
bm.add_related_string("MSIFileDelete", tostring(l_0_1), bm.RelatedStringBMReport)
return mp.INFECTED
