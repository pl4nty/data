-- Threat: !InfrastructureShared
-- Name: 3778dbc77476
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
