-- Threat: !InfrastructureShared
-- Name: 3a78237ffdcf
-- Type: 21

if peattributes.isexe == true and pesecs[5].Name == ".reloc" and pesecs[5].Characteristics == 1107296320 and mp.getfilesize() >= 9000000 and mp.getfilesize() <= 15000000 then
  return mp.INFECTED
end
return mp.CLEAN
