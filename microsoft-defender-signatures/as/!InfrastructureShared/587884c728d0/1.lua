-- Threat: !InfrastructureShared
-- Name: 587884c728d0
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
