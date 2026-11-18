-- Threat: !InfrastructureShared
-- Name: 4c7841d18b95
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
