-- Threat: !InfrastructureShared
-- Name: 54789a5a74bc
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
