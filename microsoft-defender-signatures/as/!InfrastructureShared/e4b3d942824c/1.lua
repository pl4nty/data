-- Threat: !InfrastructureShared
-- Name: e4b3d942824c
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "\\mmc.exe", 1, true) or string.find(l_0_0, "\\taskhostw.exe", 1, true) or string.find(l_0_0, "\\svchost.exe", 1, true) or string.find(l_0_0, "\\mousocoreworker.exe", 1, true) or string.find(l_0_0, "\\dellsupportassistremedationservice.exe", 1, true) or string.find(l_0_0, "\\wrsa.exe", 1, true) or string.find(l_0_0, "\\aibroker.exe", 1, true)) then
  return mp.CLEAN
end
return mp.INFECTED
