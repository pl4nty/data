-- Threat: !InfrastructureShared
-- Name: 487834742059
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
