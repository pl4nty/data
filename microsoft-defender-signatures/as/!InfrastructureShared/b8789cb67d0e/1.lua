-- Threat: !InfrastructureShared
-- Name: b8789cb67d0e
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
