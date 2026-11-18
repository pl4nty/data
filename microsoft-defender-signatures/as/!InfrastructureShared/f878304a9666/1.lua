-- Threat: !InfrastructureShared
-- Name: f878304a9666
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
