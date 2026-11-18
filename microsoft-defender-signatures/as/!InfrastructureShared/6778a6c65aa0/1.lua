-- Threat: !InfrastructureShared
-- Name: 6778a6c65aa0
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
