-- Threat: !InfrastructureShared
-- Name: 15b36e3c3e76
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "system32\\mrt.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
