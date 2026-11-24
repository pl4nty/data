-- Threat: !InfrastructureShared
-- Name: c578bdde2f69
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
