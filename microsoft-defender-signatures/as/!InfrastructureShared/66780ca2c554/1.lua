-- Threat: !InfrastructureShared
-- Name: 66780ca2c554
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
