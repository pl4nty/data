-- Threat: !InfrastructureShared
-- Name: 1017825c90d49
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
