-- Threat: !InfrastructureShared
-- Name: 77786dc9f89a
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
