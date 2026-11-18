-- Threat: !InfrastructureShared
-- Name: 8461f5899c48
-- Type: 21

if peattributes.no_security == false then
  return mp.INFECTED
end
return mp.CLEAN
