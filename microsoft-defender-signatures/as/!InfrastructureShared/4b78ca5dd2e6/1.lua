-- Threat: !InfrastructureShared
-- Name: 4b78ca5dd2e6
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
