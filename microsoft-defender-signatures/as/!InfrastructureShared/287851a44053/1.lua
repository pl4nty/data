-- Threat: !InfrastructureShared
-- Name: 287851a44053
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
