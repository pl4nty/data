-- Threat: !InfrastructureShared
-- Name: 357851bb14cb
-- Type: 21

if peattributes.ismsil == true and pesecs[3].Name == ".reloc" and pesecs[3].Characteristics == 1107296320 then
  return mp.INFECTED
end
return mp.CLEAN
