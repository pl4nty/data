-- Threat: !InfrastructureShared
-- Name: 25b30630da33
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 ~= nil then
  if string.find(l_0_0, "\\svchost.exe", 1, true) or string.find(l_0_0, "\\rubyw.exe", 1, true) then
    return mp.CLEAN
  end
  if mp.IsKnownFriendlyFile(MpCommon.PathToWin32Path(l_0_0), true, true) == true then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
