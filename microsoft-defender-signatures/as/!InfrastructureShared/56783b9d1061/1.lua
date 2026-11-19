-- Threat: !InfrastructureShared
-- Name: 56783b9d1061
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
