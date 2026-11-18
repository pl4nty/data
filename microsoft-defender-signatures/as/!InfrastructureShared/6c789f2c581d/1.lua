-- Threat: !InfrastructureShared
-- Name: 6c789f2c581d
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
