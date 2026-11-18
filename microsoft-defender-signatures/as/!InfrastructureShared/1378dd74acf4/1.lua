-- Threat: !InfrastructureShared
-- Name: 1378dd74acf4
-- Type: 21

if pehdr.NumberOfSections > 0 and epcode[1] == 131 and epcode[2] == 60 and epcode[5] == 119 and epcode[6] == 254 and (pesecs[pehdr.NumberOfSections].Name == ".reloc" or pesecs[pehdr.NumberOfSections].Name == ".rsrc") then
  return mp.INFECTED
end
return mp.CLEAN
