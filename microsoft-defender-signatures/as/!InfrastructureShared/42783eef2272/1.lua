-- Threat: !InfrastructureShared
-- Name: 42783eef2272
-- Type: 21

if peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
