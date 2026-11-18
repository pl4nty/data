-- Threat: !InfrastructureShared
-- Name: 5978d37249cb
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
