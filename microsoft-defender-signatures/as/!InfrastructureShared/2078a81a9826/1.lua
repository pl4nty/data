-- Threat: !InfrastructureShared
-- Name: 2078a81a9826
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true and pehdr.AddressOfEntryPoint ~= 763246 then
  return mp.INFECTED
end
return mp.CLEAN
