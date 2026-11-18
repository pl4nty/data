-- Threat: !InfrastructureShared
-- Name: 3e7869f02a80
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
mp.set_mpattribute("HSTR:Win64/SearchMZMarker.A")
return mp.CLEAN
