-- Threat: !InfrastructureShared
-- Name: 60783f2a2e38
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
