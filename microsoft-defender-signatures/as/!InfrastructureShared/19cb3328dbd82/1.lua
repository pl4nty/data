-- Threat: !InfrastructureShared
-- Name: 19cb3328dbd82
-- Type: 21

local l_0_0
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p1
end
if l_0_0 ~= nil and string.find(string.lower(l_0_0), "\\appdata\\local\\temp\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
