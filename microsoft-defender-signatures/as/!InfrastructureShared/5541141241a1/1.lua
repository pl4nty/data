-- Threat: !InfrastructureShared
-- Name: 5541141241a1
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 ~= nil and string.find(l_0_0, ":", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
