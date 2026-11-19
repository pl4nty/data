-- Threat: !InfrastructureShared
-- Name: 5f8f99b9d96c
-- Type: 21

local l_0_0 = hstrlog[2].hitcount
local l_0_1 = hstrlog[1].hitcount
if 5 < l_0_0 or 5 < l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
