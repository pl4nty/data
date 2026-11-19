-- Threat: !InfrastructureShared
-- Name: 4678fd4fe164
-- Type: 21

if peattributes.isexe == true and pesecs[6].Name == ".sc=" then
  return mp.INFECTED
end
return mp.CLEAN
