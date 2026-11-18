-- Threat: !InfrastructureShared
-- Name: 4c78160963d8
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
