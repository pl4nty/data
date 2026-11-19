-- Threat: !InfrastructureShared
-- Name: 9b7843532d43
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
