-- Threat: !InfrastructureShared
-- Name: 657859a3b2a1
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
