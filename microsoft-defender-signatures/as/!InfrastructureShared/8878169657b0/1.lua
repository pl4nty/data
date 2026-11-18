-- Threat: !InfrastructureShared
-- Name: 8878169657b0
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.LOWFI
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
return mp.LOWFI
