-- Threat: !InfrastructureShared
-- Name: 7878b38222cb
-- Type: 21

if peattributes.isexe == true and pesecs[6].Name == ".reloc" and pesecs[6].Characteristics == 1107296320 and mp.getfilesize() >= 7300000 and mp.getfilesize() <= 8500000 then
  return mp.INFECTED
end
return mp.CLEAN
