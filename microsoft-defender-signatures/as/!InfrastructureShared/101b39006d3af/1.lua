-- Threat: !InfrastructureShared
-- Name: 101b39006d3af
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[4].utf8p1))
end
if l_0_0 ~= nil then
  if string.find(l_0_0, ".installer.", 1, true) then
    return mp.CLEAN
  end
  if mp.IsKnownFriendlyFile(l_0_0, true, false) then
    return mp.CLEAN
  end
  bm.add_related_string("NPP_update", tostring(l_0_0), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
