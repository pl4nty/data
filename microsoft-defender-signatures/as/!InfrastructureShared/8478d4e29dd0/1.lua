-- Threat: !InfrastructureShared
-- Name: 8478d4e29dd0
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
