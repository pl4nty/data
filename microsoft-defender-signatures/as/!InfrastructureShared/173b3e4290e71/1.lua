-- Threat: !InfrastructureShared
-- Name: 173b3e4290e71
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\outlook.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
