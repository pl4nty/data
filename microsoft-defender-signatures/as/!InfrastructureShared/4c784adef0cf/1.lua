-- Threat: !InfrastructureShared
-- Name: 4c784adef0cf
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
