-- Threat: !InfrastructureShared
-- Name: a0789d2146eb
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
