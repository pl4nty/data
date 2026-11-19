-- Threat: !InfrastructureShared
-- Name: 3778041832f6
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
