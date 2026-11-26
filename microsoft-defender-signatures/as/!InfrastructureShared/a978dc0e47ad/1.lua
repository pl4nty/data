-- Threat: !InfrastructureShared
-- Name: a978dc0e47ad
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
