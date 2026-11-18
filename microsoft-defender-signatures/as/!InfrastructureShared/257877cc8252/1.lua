-- Threat: !InfrastructureShared
-- Name: 257877cc8252
-- Type: 21

if peattributes.isexe == true and pehdr.NumberOfSections == 1 and pesecs[1].Name == "foo" then
  return mp.INFECTED
end
return mp.CLEAN
