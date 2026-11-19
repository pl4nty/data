-- Threat: !InfrastructureShared
-- Name: 6d7808d42e32
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
