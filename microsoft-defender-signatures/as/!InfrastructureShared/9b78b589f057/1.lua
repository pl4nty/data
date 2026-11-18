-- Threat: !InfrastructureShared
-- Name: 9b78b589f057
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
