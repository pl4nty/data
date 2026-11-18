-- Threat: !InfrastructureShared
-- Name: 49b31130f434
-- Type: 21

local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
if string.find(l_0_0, "\\spyhunter\\", 1, true) then
  return mp.CLEAN
elseif string.find(l_0_0, "\\yandex\\", 1, true) then
  return mp.CLEAN
elseif string.find(l_0_0, "\\utiltool\\", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
