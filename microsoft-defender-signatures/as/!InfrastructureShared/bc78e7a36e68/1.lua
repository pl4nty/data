-- Threat: !InfrastructureShared
-- Name: bc78e7a36e68
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
