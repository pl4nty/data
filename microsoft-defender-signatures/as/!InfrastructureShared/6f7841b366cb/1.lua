-- Threat: !InfrastructureShared
-- Name: 6f7841b366cb
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
