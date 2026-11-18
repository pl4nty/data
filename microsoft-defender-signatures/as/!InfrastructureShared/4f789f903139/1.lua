-- Threat: !InfrastructureShared
-- Name: 4f789f903139
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
