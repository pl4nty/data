-- Threat: !InfrastructureShared
-- Name: 7f785eadf180
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
