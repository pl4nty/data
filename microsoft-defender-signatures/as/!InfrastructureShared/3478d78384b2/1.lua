-- Threat: !InfrastructureShared
-- Name: 3478d78384b2
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
