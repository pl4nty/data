-- Threat: !InfrastructureShared
-- Name: 1a3b3c6ffb296
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
return mp.INFECTED
