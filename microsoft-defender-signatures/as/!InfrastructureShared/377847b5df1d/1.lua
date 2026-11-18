-- Threat: !InfrastructureShared
-- Name: 377847b5df1d
-- Type: 21

if peattributes.isdll or peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
