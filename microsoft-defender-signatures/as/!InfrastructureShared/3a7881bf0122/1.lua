-- Threat: !InfrastructureShared
-- Name: 3a7881bf0122
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
