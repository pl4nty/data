-- Threat: !InfrastructureShared
-- Name: 6778156adf06
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
