-- Threat: !InfrastructureShared
-- Name: 6e78a655547c
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
