-- Threat: !InfrastructureShared
-- Name: 3578333d6e05
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
