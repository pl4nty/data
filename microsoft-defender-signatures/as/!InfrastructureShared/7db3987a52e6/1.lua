-- Threat: !InfrastructureShared
-- Name: 7db3987a52e6
-- Type: 21

local l_0_0, l_0_1
l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
l_0_1 = string.lower(this_sigattrlog[4].utf8p1)
if l_0_0 ~= nil and l_0_1 ~= nil then
  if string.find(l_0_0, "c:\\documents and settings\\", 1, true) ~= nil and string.find(l_0_1, "c:\\documents and settings\\", 1, true) ~= nil then
    return mp.INFECTED
  end
  if string.find(l_0_0, "c:\\users\\", 1, true) ~= nil and string.find(l_0_1, "c:\\users\\", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
