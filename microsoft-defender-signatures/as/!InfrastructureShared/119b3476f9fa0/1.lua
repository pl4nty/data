-- Threat: !InfrastructureShared
-- Name: 119b3476f9fa0
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 ~= nil and string.len(l_0_0) > 4 and string.find(l_0_0, "nightmare", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
