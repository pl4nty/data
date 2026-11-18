-- Threat: !InfrastructureShared
-- Name: 467812881363
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
mp.set_mpattribute("HSTR:CobaltStrike.F!entry")
return mp.LOWFI
