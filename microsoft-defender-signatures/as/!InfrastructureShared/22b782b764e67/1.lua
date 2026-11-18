-- Threat: !InfrastructureShared
-- Name: 22b782b764e67
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
