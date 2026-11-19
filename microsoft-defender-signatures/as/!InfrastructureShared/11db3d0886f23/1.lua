-- Threat: !InfrastructureShared
-- Name: 11db3d0886f23
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
end
if l_0_0 ~= nil and 3 < string.len(l_0_0) and string.find(l_0_0, "start https:", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
