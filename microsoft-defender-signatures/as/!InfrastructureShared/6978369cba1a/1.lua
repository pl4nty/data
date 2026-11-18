-- Threat: !InfrastructureShared
-- Name: 6978369cba1a
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
