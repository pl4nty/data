-- Threat: !InfrastructureShared
-- Name: a07864009425
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
