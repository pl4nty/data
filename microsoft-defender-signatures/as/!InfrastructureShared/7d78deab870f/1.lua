-- Threat: !InfrastructureShared
-- Name: 7d78deab870f
-- Type: 21

if peattributes.isdll or peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
