-- Threat: !InfrastructureShared
-- Name: 60783742139d
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
