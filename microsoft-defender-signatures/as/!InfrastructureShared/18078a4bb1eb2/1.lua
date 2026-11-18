-- Threat: !InfrastructureShared
-- Name: 18078a4bb1eb2
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
