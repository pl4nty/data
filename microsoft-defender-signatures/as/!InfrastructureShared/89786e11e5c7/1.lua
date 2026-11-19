-- Threat: !InfrastructureShared
-- Name: 89786e11e5c7
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
