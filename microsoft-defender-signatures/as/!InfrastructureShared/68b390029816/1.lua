-- Threat: !InfrastructureShared
-- Name: 68b390029816
-- Type: 21

local l_0_0 = this_sigattrlog[1].utf8p2
if l_0_0 and string.len(l_0_0) > 50 then
  return mp.INFECTED
end
return mp.CLEAN
