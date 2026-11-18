-- Threat: !InfrastructureShared
-- Name: 9d787d6d4d35
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 and mp.HSTR_CALLER_SMS == l_0_0 then
  mp.changedetectionname(805306755)
end
return mp.INFECTED
