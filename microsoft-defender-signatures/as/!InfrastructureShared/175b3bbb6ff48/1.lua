-- Threat: !InfrastructureShared
-- Name: 175b3bbb6ff48
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and string.find(string.lower(l_0_0), "\\appdata\\local\\temp\\", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
