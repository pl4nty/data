-- Threat: !InfrastructureShared
-- Name: 4078fcfb1a2b
-- Type: 21

if peattributes.isexe == true and pesecs[7].Name == ".reloc" and pesecs[7].Characteristics == 1107296320 then
  return mp.INFECTED
end
return mp.CLEAN
