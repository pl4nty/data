-- Threat: !InfrastructureShared
-- Name: 5e78e55fa53a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true and pehdr.AddressOfEntryPoint ~= 328238 then
  return mp.INFECTED
end
return mp.CLEAN
