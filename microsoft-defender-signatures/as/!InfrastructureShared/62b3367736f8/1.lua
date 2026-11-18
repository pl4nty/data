-- Threat: !InfrastructureShared
-- Name: 62b3367736f8
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 ~= nil and string.find(string.lower(l_0_0), "\\appdata\\local\\temp\\", 1, true) ~= nil and (string.find(string.lower(l_0_0), ".com", 1, true) ~= nil or string.find(string.lower(l_0_0), ".pif", 1, true) ~= nil or string.find(string.lower(l_0_0), ".src", 1, true) ~= nil) then
  return mp.INFECTED
end
return mp.CLEAN
