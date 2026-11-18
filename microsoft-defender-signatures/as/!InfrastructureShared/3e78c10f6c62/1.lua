-- Threat: !InfrastructureShared
-- Name: 3e78c10f6c62
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
