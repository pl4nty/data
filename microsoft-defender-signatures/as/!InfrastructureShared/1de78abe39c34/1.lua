-- Threat: !InfrastructureShared
-- Name: 1de78abe39c34
-- Type: 21

if peattributes.isexe == true and pesecs[7].Name == ".reloc" and pesecs[7].Characteristics == 1107296320 then
  return mp.INFECTED
end
return mp.CLEAN
