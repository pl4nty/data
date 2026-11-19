-- Threat: !InfrastructureShared
-- Name: 5f785db1c63c
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
