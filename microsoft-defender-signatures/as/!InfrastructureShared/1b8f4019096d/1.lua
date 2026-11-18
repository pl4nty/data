-- Threat: !InfrastructureShared
-- Name: 1b8f4019096d
-- Type: 21

local l_0_0 = hstrlog[1].hitcount
if 5 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
