-- Threat: !InfrastructureShared
-- Name: 8b78a1e38106
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
