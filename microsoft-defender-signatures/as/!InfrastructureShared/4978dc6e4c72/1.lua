-- Threat: !InfrastructureShared
-- Name: 4978dc6e4c72
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
