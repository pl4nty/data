-- Threat: !InfrastructureShared
-- Name: 7278af182233
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
