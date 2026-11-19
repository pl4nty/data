-- Threat: !InfrastructureShared
-- Name: 27785d9c0755
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
