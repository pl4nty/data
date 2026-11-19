-- Threat: !InfrastructureShared
-- Name: 84780ff68ff9
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
