-- Threat: !InfrastructureShared
-- Name: 63785e6095bd
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
