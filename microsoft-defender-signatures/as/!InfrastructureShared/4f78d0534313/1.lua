-- Threat: !InfrastructureShared
-- Name: 4f78d0534313
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
