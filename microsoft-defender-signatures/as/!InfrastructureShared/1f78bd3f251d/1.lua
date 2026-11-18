-- Threat: !InfrastructureShared
-- Name: 1f78bd3f251d
-- Type: 21

if peattributes.isexe == true and pesecs[5].Name == "zaas" then
  return mp.INFECTED
end
return mp.CLEAN
