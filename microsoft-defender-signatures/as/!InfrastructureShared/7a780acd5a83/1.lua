-- Threat: !InfrastructureShared
-- Name: 7a780acd5a83
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
