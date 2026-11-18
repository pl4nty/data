-- Threat: !InfrastructureShared
-- Name: e6782d64296a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
