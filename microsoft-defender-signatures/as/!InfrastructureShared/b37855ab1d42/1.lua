-- Threat: !InfrastructureShared
-- Name: b37855ab1d42
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
