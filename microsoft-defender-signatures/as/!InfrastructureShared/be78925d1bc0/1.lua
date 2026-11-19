-- Threat: !InfrastructureShared
-- Name: be78925d1bc0
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
