-- Threat: !InfrastructureShared
-- Name: 2861649064b4
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 ~= nil and l_0_0 == mp.HSTR_CALLER_SMS then
  return mp.INFECTED
end
return mp.CLEAN
