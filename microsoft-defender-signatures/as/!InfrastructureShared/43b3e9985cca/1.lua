-- Threat: !InfrastructureShared
-- Name: 43b3e9985cca
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0 ~= nil and (string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\windows\\", 1, true)) then
  return mp.CLEAN
end
return mp.INFECTED
