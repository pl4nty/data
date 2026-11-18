-- Threat: !InfrastructureShared
-- Name: ad78ae5d85af
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true and pehdr.AddressOfEntryPoint ~= 874974 then
  return mp.INFECTED
end
return mp.CLEAN
