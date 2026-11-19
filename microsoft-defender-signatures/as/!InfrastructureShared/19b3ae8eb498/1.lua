-- Threat: !InfrastructureShared
-- Name: 19b3ae8eb498
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 and string.find(l_0_0, "isoudmx", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
