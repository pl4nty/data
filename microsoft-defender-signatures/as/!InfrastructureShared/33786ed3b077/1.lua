-- Threat: !InfrastructureShared
-- Name: 33786ed3b077
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
