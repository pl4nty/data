-- Threat: !InfrastructureShared
-- Name: 8a780645211c
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
