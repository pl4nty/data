-- Threat: !InfrastructureShared
-- Name: 9d780c71d70e
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
return mp.LOWFI
