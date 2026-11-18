-- Threat: !InfrastructureShared
-- Name: ab78bcdd0c4d
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
