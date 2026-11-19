-- Threat: !InfrastructureShared
-- Name: 7478366b3073
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
