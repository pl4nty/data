-- Threat: !InfrastructureShared
-- Name: 5778c6500f84
-- Type: 21

if peattributes.isexe == true and pehdr.NumberOfSections == 5 and pesecs[4].Name == ".rsrc" and pesecs[4].Characteristics == 1073741888 then
  return mp.INFECTED
end
return mp.CLEAN
