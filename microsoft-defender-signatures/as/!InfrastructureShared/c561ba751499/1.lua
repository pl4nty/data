-- Threat: !InfrastructureShared
-- Name: c561ba751499
-- Type: 21

if peattributes.no_security == false then
  return mp.INFECTED
end
return mp.CLEAN
