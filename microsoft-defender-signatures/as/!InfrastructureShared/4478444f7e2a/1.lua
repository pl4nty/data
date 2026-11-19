-- Threat: !InfrastructureShared
-- Name: 4478444f7e2a
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
