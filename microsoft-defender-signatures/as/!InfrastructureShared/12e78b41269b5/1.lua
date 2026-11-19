-- Threat: !InfrastructureShared
-- Name: 12e78b41269b5
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
