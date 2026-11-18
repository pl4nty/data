-- Threat: !InfrastructureShared
-- Name: 5078d752be44
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
