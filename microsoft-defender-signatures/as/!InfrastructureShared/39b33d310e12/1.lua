-- Threat: !InfrastructureShared
-- Name: 39b33d310e12
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil and not string.find(string.lower(l_0_0), " /create ", 1, true) and not string.find(string.lower(l_0_0), ".hta", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
