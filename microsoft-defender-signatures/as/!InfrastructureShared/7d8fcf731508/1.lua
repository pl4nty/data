-- Threat: !InfrastructureShared
-- Name: 7d8fcf731508
-- Type: 21

local l_0_0 = hstrlog[1].hitcount
local l_0_1 = hstrlog[2].hitcount
local l_0_2 = hstrlog[3].hitcount
if 5 < l_0_0 or 5 < l_0_1 or 5 < l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
