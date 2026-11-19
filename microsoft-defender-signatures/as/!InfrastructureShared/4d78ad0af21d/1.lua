-- Threat: !InfrastructureShared
-- Name: 4d78ad0af21d
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
