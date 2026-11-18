-- Threat: !InfrastructureShared
-- Name: 24788bb4300c
-- Type: 21

if epcode[1] == 72 and epcode[2] == 137 and peattributes.isexe == true and pehdr.AddressOfEntryPoint == 314640 and pesecs[6].Name == ".reloc" and pesecs[6].Characteristics == 1107296320 then
  return mp.INFECTED
end
return mp.CLEAN
