-- Threat: !InfrastructureShared
-- Name: 5678e732bd83
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
