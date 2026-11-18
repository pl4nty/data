-- Threat: !InfrastructureShared
-- Name: 5e788dd7a6bd
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
