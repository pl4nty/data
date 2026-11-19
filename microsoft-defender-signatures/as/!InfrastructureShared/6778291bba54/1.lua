-- Threat: !InfrastructureShared
-- Name: 6778291bba54
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
