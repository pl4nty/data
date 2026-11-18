-- Threat: !InfrastructureShared
-- Name: 2c78e2261d3f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
