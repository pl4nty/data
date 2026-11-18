-- Threat: !InfrastructureShared
-- Name: 4c78dd0c8f6f
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
