-- Threat: !InfrastructureShared
-- Name: 617884064082
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
