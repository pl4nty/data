-- Threat: !InfrastructureShared
-- Name: 6ab3ac40f475
-- Type: 21

local l_0_0
l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if l_0_0 ~= nil and string.find(l_0_0, "windows\\system32\\services.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
