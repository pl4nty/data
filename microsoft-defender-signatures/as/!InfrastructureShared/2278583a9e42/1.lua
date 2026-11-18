-- Threat: !InfrastructureShared
-- Name: 2278583a9e42
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true and pehdr.AddressOfEntryPoint ~= 18609262 then
  return mp.INFECTED
end
return mp.CLEAN
