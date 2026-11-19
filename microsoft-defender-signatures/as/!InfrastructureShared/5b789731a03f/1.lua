-- Threat: !InfrastructureShared
-- Name: 5b789731a03f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
