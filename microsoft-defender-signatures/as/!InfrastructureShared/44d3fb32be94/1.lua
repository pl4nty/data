-- Threat: !InfrastructureShared
-- Name: 44d3fb32be94
-- Type: 21

local l_0_0 = hstrlog[1].hitcount
if 5 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
