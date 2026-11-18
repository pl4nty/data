-- Threat: !InfrastructureShared
-- Name: 3f7836c53a90
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
