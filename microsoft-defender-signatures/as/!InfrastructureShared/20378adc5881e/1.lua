-- Threat: !InfrastructureShared
-- Name: 20378adc5881e
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
