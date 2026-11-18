-- Threat: !InfrastructureShared
-- Name: 3678fc25e2ec
-- Type: 21

if peattributes.isexe == true and pehdr.NumberOfSections == 6 and pesecs[5].Name == ".rsrc" and pesecs[5].Characteristics == 1073741888 then
  return mp.INFECTED
end
return mp.CLEAN
