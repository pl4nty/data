-- Threat: !InfrastructureShared
-- Name: 24780062f1ff
-- Type: 21

if peattributes.isdll or peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
