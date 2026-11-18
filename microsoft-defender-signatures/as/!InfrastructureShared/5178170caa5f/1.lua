-- Threat: !InfrastructureShared
-- Name: 5178170caa5f
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
