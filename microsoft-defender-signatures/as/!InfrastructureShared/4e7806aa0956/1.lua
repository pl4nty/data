-- Threat: !InfrastructureShared
-- Name: 4e7806aa0956
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
