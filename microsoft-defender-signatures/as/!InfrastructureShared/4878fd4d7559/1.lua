-- Threat: !InfrastructureShared
-- Name: 4878fd4d7559
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
