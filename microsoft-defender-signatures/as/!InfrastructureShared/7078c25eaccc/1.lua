-- Threat: !InfrastructureShared
-- Name: 7078c25eaccc
-- Type: 21

if peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
