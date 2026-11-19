-- Threat: !InfrastructureShared
-- Name: 25b3328d6b44
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 ~= nil and string.find(l_0_0, "\\wmiprvse.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
