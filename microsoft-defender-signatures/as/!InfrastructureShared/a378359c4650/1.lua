-- Threat: !InfrastructureShared
-- Name: a378359c4650
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
