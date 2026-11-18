-- Threat: !InfrastructureShared
-- Name: 39d38163d094
-- Type: 21

local l_0_0 = hstrlog[1].hitcount
if 5 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
