-- Threat: !InfrastructureShared
-- Name: 7f784e562c9f
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
