-- Threat: !InfrastructureShared
-- Name: 74785362b77a
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
