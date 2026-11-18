-- Threat: !InfrastructureShared
-- Name: 51787e3c255e
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
