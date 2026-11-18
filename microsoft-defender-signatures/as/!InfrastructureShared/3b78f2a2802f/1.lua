-- Threat: !InfrastructureShared
-- Name: 3b78f2a2802f
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
