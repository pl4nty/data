-- Threat: !InfrastructureShared
-- Name: 12db3ae20e954
-- Type: 21

local l_0_0 = this_sigattrlog[3].timestamp
local l_0_1 = this_sigattrlog[2].timestamp
if l_0_0 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_0 - l_0_1
if 10000000 < l_0_2 then
  return mp.CLEAN
end
return mp.INFECTED
