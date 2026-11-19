-- Threat: !InfrastructureShared
-- Name: 6978ebd62f0f
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
