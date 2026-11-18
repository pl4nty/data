-- Threat: !InfrastructureShared
-- Name: 3a786c974d54
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
