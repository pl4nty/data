-- Threat: !InfrastructureShared
-- Name: 947887135c65
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
