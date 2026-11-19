-- Threat: !InfrastructureShared
-- Name: 8a784373ed61
-- Type: 21

local l_0_0 = mp.HSTR_WEIGHT
if l_0_0 ~= nil and mp.bitand(l_0_0, 15) >= 2 then
  return mp.INFECTED
end
return mp.CLEAN
