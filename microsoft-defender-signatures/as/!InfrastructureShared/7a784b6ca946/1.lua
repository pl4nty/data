-- Threat: !InfrastructureShared
-- Name: 7a784b6ca946
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
