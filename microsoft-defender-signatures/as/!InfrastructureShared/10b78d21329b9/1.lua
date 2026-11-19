-- Threat: !InfrastructureShared
-- Name: 10b78d21329b9
-- Type: 21

if peattributes.isdll or peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
