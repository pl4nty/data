-- Threat: !InfrastructureShared
-- Name: cf789f1227f1
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
