-- Threat: !InfrastructureShared
-- Name: 81782313939a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
