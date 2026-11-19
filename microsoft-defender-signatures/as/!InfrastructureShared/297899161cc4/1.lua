-- Threat: !InfrastructureShared
-- Name: 297899161cc4
-- Type: 21

if pehdr.AddressOfEntryPoint == 90675 and pesecs[6].Name == ".reloc" and pesecs[6].Characteristics == 1107296320 then
  return mp.INFECTED
end
return mp.CLEAN
