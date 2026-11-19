-- Threat: !InfrastructureShared
-- Name: a578fa195206
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 and mp.HSTR_CALLER_SMS == l_0_0 then
  mp.changedetectionname(805306755)
end
return mp.INFECTED
