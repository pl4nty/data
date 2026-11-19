-- Threat: !InfrastructureShared
-- Name: 42784f24d53e
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
