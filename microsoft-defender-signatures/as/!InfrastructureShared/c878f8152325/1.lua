-- Threat: !InfrastructureShared
-- Name: c878f8152325
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
