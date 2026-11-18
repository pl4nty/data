-- Threat: !InfrastructureShared
-- Name: 168787da3bc14
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 ~= nil and mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
return mp.LOWFI
