-- Threat: !InfrastructureShared
-- Name: 2b7877e39e58
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
