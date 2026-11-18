-- Threat: !InfrastructureShared
-- Name: 5d78e8bb972e
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
