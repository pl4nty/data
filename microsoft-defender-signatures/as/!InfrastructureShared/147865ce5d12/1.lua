-- Threat: !InfrastructureShared
-- Name: 147865ce5d12
-- Type: 21

if peattributes.isdll or peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
