-- Threat: !InfrastructureShared
-- Name: 4478c0851ce4
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win32/Zusy.GT") then
  return mp.INFECTED
end
return mp.CLEAN
