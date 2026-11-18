-- Threat: !InfrastructureShared
-- Name: 348f8910b7a6
-- Type: 21

local l_0_0 = hstrlog[1].hitcount
local l_0_1 = hstrlog[2].hitcount
if l_0_0 - 1 == l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
