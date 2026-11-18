-- Threat: !InfrastructureShared
-- Name: 4f78b0458850
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
