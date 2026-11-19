-- Threat: !InfrastructureShared
-- Name: 26f78f4f41898
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 ~= nil and mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
