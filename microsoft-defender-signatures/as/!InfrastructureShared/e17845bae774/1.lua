-- Threat: !InfrastructureShared
-- Name: e17845bae774
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
