-- Threat: !InfrastructureShared
-- Name: 8bb3f12f1a64
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil and string.find(l_0_0, "-h", 1, true) and string.find(l_0_0, "-x", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
