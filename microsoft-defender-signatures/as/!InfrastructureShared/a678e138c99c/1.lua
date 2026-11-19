-- Threat: !InfrastructureShared
-- Name: a678e138c99c
-- Type: 21

if peattributes.isdll or peattributes.isexe then
  return mp.CLEAN
end
return mp.INFECTED
