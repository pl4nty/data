-- Threat: !InfrastructureShared
-- Name: 2f7885ff2c50
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
