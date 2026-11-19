-- Threat: !InfrastructureShared
-- Name: 368f3129bd97
-- Type: 21

local l_0_0 = hstrlog[1].hitcount
if 10 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
