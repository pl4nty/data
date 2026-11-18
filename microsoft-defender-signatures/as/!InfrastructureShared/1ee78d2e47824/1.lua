-- Threat: !InfrastructureShared
-- Name: 1ee78d2e47824
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 ~= nil and mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
return mp.LOWFI
