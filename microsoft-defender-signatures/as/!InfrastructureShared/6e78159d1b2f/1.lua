-- Threat: !InfrastructureShared
-- Name: 6e78159d1b2f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
