-- Threat: !InfrastructureShared
-- Name: 55b3d5c350f8
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "\\windows\\explorer.exe", 1, true) or string.find(l_0_0, "\\windows\\system32\\mrt.exe", 1, true) or string.find(l_0_0, "\\windows\\system32\\mpsigstub.exe", 1, true) or string.find(l_0_0, "\\windows\\cynetms.exe", 1, true)) then
  return mp.CLEAN
end
return mp.INFECTED
