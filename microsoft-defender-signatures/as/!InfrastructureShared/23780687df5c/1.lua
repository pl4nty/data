-- Threat: !InfrastructureShared
-- Name: 23780687df5c
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
