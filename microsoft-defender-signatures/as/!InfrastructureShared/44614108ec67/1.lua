-- Threat: !InfrastructureShared
-- Name: 44614108ec67
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
