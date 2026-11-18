-- Threat: !InfrastructureShared
-- Name: 2db3d0919dc0
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "\\virtualboxvm.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
