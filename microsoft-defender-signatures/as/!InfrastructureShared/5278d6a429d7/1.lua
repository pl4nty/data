-- Threat: !InfrastructureShared
-- Name: 5278d6a429d7
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
