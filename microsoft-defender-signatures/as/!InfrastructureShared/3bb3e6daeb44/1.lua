-- Threat: !InfrastructureShared
-- Name: 3bb3e6daeb44
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -10) == "\\mstsc.exe" or string.sub(l_0_0, -27) == "\\remotedesktopmanager64.exe" or string.sub(l_0_0, -11) == "\\rdcman.exe" or string.sub(l_0_0, -14) == "\\mremoteng.exe" or string.sub(l_0_0, -10) == "\\lsass.exe" then
  return mp.CLEAN
end
return mp.INFECTED
