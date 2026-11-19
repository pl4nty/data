-- Threat: !InfrastructureShared
-- Name: 115b3e5cc01d0
-- Type: 21

local l_0_0
if this_sigattrlog[7].matched and this_sigattrlog[7].wp2 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p2
end
if string.find(l_0_0, "wheel", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
