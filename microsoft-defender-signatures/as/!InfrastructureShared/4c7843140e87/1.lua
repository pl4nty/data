-- Threat: !InfrastructureShared
-- Name: 4c7843140e87
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
