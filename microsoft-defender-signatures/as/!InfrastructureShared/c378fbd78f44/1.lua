-- Threat: !InfrastructureShared
-- Name: c378fbd78f44
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
