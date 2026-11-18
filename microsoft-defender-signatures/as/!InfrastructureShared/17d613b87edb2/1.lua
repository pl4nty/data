-- Threat: !InfrastructureShared
-- Name: 17d613b87edb2
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
