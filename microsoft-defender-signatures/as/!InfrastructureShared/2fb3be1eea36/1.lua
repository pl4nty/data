-- Threat: !InfrastructureShared
-- Name: 2fb3be1eea36
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil and (string.find(l_0_0, "if=/dev/zero", 1, true) or string.find(l_0_0, "if=/dev/random", 1, true) or string.find(l_0_0, "if=/dev/urandom", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
