-- Threat: !InfrastructureShared
-- Name: 102784a705458
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
