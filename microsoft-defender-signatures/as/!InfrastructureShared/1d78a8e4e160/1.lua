-- Threat: !InfrastructureShared
-- Name: 1d78a8e4e160
-- Type: 21

if peattributes.isdll or peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
