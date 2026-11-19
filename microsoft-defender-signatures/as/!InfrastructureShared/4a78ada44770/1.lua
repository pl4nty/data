-- Threat: !InfrastructureShared
-- Name: 4a78ada44770
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
