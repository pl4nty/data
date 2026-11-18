-- Threat: !InfrastructureShared
-- Name: 388fd6ff6771
-- Type: 21

local l_0_0 = hstrlog[1].hitcount
local l_0_1 = hstrlog[2].hitcount
if 15 < l_0_0 or 15 < l_0_1 or 15 < l_0_0 + l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
