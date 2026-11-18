-- Threat: !InfrastructureShared
-- Name: 987871085bd0
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
