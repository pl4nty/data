-- Threat: !InfrastructureShared
-- Name: 3078caeffcfe
-- Type: 21

if peattributes.isexe == true and peattributes.hasexports == false and pesecs[6].Name == ".reloc" and pesecs[6].Characteristics == 1107296320 then
  return mp.INFECTED
end
return mp.CLEAN
