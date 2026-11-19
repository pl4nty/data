-- Threat: !InfrastructureShared
-- Name: 5e7820cdd660
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
