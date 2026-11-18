-- Threat: !InfrastructureShared
-- Name: 4f782c0e249c
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
