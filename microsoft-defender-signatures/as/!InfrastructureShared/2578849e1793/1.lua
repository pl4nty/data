-- Threat: !InfrastructureShared
-- Name: 2578849e1793
-- Type: 21

if peattributes.isdll or peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
