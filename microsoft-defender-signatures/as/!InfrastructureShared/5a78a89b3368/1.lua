-- Threat: !InfrastructureShared
-- Name: 5a78a89b3368
-- Type: 21

if peattributes.isexe == true and pehdr.NumberOfSections == 5 and pesecs[4].Name == ".rsrc" and pesecs[4].Characteristics == 1073741888 then
  return mp.INFECTED
end
return mp.CLEAN
