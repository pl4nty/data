-- Threat: !InfrastructureShared
-- Name: 3c78974792ef
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
