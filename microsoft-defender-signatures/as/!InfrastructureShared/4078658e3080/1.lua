-- Threat: !InfrastructureShared
-- Name: 4078658e3080
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
