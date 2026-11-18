-- Threat: !InfrastructureShared
-- Name: 5b78cc3839dd
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
