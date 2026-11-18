-- Threat: !InfrastructureShared
-- Name: 6d78ec3f76eb
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
