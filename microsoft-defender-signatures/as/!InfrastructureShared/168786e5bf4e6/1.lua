-- Threat: !InfrastructureShared
-- Name: 168786e5bf4e6
-- Type: 21

local l_0_0 = mp.HSTR_WEIGHT
if l_0_0 ~= nil and mp.bitand(l_0_0, 15) >= 1 then
  return mp.INFECTED
end
return mp.CLEAN
