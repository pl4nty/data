-- Threat: !InfrastructureShared
-- Name: 51780d593001
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
