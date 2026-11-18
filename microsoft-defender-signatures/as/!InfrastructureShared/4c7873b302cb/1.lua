-- Threat: !InfrastructureShared
-- Name: 4c7873b302cb
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
