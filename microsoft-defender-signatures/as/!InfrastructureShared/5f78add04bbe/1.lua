-- Threat: !InfrastructureShared
-- Name: 5f78add04bbe
-- Type: 21

if pehdr.AddressOfEntryPoint == 0 and pe.get_exports() > 646 and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
