-- Threat: !InfrastructureShared
-- Name: 8978377d1232
-- Type: 21

if peattributes.isexe == true and pesecs[1].Name == ".data" then
  return mp.INFECTED
end
return mp.CLEAN
