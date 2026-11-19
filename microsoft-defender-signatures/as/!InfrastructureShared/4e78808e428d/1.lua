-- Threat: !InfrastructureShared
-- Name: 4e78808e428d
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
