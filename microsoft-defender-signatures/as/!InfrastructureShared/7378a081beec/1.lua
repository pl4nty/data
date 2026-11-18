-- Threat: !InfrastructureShared
-- Name: 7378a081beec
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
