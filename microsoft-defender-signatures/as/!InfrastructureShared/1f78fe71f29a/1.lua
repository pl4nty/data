-- Threat: !InfrastructureShared
-- Name: 1f78fe71f29a
-- Type: 21

if peattributes.isdll or peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
