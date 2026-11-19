-- Threat: !InfrastructureShared
-- Name: ce782b49fe23
-- Type: 21

if peattributes.isexe == true and pesecs[5].Name == ".gr43" and pesecs[6].Name == ".00cfg" then
  return mp.INFECTED
end
return mp.CLEAN
