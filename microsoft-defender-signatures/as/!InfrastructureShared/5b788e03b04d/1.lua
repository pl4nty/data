-- Threat: !InfrastructureShared
-- Name: 5b788e03b04d
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
