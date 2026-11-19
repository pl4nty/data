-- Threat: !InfrastructureShared
-- Name: 63789a59ef5a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
