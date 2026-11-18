-- Threat: !InfrastructureShared
-- Name: 2f786315a587
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
