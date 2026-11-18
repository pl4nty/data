-- Threat: !InfrastructureShared
-- Name: 29a78dba6b2d6
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.LOWFI
end
return mp.INFECTED
