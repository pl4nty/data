-- Threat: !InfrastructureShared
-- Name: 41d3fc7967c3
-- Type: 21

local l_0_0 = hstrlog[1].hitcount
if 5 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
