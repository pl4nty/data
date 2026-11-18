-- Threat: !InfrastructureShared
-- Name: 33784b7b2808
-- Type: 21

if peattributes.isexe == true and pehdr.NumberOfSections == 6 and pesecs[6].Name == ".reloc" and pesecs[6].Characteristics == 1107296320 then
  return mp.INFECTED
end
return mp.CLEAN
