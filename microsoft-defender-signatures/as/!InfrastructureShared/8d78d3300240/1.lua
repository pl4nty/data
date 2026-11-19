-- Threat: !InfrastructureShared
-- Name: 8d78d3300240
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
