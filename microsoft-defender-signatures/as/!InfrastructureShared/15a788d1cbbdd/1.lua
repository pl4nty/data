-- Threat: !InfrastructureShared
-- Name: 15a788d1cbbdd
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
