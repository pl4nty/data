-- Threat: !InfrastructureShared
-- Name: 8a7866411472
-- Type: 21

if peattributes.isexe == true and pesecs[5].Name == ".fptable" then
  return mp.INFECTED
end
return mp.CLEAN
