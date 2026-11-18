-- Threat: !InfrastructureShared
-- Name: e0782bf187d7
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
