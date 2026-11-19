-- Threat: !InfrastructureShared
-- Name: 42788d6ff46e
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
