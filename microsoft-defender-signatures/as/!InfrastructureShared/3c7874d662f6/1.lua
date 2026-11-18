-- Threat: !InfrastructureShared
-- Name: 3c7874d662f6
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and pehdr.AddressOfEntryPoint ~= 195006 then
  return mp.INFECTED
end
return mp.CLEAN
