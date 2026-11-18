-- Threat: !InfrastructureShared
-- Name: 517874fbf067
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
