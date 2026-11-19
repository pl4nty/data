-- Threat: !InfrastructureShared
-- Name: 6478a7ba690c
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
