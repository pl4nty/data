-- Threat: !InfrastructureShared
-- Name: 3b78c01db269
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
