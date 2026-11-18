-- Threat: !InfrastructureShared
-- Name: 6078d04c652b
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
