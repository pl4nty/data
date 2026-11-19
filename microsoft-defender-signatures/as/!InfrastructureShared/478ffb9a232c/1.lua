-- Threat: !InfrastructureShared
-- Name: 478ffb9a232c
-- Type: 21

local l_0_0 = hstrlog[1].hitcount
local l_0_1 = hstrlog[2].hitcount
if 10 < l_0_0 or 10 < l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
