-- Threat: !InfrastructureShared
-- Name: 7e784ac12de8
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
