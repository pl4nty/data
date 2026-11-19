-- Threat: !InfrastructureShared
-- Name: 8540e4e60a2d
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
