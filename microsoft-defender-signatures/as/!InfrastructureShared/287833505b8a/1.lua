-- Threat: !InfrastructureShared
-- Name: 287833505b8a
-- Type: 21

if peattributes.isexe == true and pesecs[5].Name == ".V1" then
  return mp.INFECTED
end
return mp.CLEAN
