-- Threat: !InfrastructureShared
-- Name: 5978f6720ac2
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
