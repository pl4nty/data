-- Threat: !InfrastructureShared
-- Name: a7b3fdac2e49
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
end
if l_0_0 ~= nil and string.find(l_0_0, "-u", 1, true) and string.find(l_0_0, "//", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
