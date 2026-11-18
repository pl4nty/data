-- Threat: !InfrastructureShared
-- Name: 4278a28849ba
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
