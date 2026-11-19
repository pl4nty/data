-- Threat: !InfrastructureShared
-- Name: 7b780f9474cd
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
