-- Threat: !InfrastructureShared
-- Name: 43b3febf1cd7
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if string.find(l_0_0, "\\werfault.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
