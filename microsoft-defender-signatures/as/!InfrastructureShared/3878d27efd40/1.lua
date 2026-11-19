-- Threat: !InfrastructureShared
-- Name: 3878d27efd40
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
