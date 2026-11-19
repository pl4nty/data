-- Threat: !InfrastructureShared
-- Name: 6378c3e02aae
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
