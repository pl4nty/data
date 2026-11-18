-- Threat: !InfrastructureShared
-- Name: 8878c870d443
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
