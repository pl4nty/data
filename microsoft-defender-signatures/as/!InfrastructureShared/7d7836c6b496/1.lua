-- Threat: !InfrastructureShared
-- Name: 7d7836c6b496
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
