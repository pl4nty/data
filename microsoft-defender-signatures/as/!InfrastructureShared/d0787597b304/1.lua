-- Threat: !InfrastructureShared
-- Name: d0787597b304
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
