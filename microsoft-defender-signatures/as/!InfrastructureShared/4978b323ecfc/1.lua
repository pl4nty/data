-- Threat: !InfrastructureShared
-- Name: 4978b323ecfc
-- Type: 21

if peattributes.isexe == true and pesecs[6].Name == ".rsrc" and pesecs[4].Characteristics == 1073741888 then
  return mp.INFECTED
end
return mp.CLEAN
