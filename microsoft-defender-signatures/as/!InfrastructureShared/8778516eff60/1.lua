-- Threat: !InfrastructureShared
-- Name: 8778516eff60
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
