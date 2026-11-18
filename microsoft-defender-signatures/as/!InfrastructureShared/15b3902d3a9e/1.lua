-- Threat: !InfrastructureShared
-- Name: 15b3902d3a9e
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "tiworker.exe", 1, true) or string.find(l_0_0, "trustedinstaller.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
