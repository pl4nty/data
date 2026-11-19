-- Threat: !InfrastructureShared
-- Name: 1978221a0af0
-- Type: 21

if peattributes.isdll or peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
