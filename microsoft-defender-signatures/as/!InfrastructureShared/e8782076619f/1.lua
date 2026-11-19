-- Threat: !InfrastructureShared
-- Name: e8782076619f
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
