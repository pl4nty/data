-- Threat: !InfrastructureShared
-- Name: 3df78f74f724e
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.LOWFI
end
return mp.INFECTED
