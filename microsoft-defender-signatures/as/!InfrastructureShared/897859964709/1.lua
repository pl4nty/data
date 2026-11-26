-- Threat: !InfrastructureShared
-- Name: 897859964709
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
