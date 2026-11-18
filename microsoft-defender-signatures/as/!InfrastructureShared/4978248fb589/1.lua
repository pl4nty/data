-- Threat: !InfrastructureShared
-- Name: 4978248fb589
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
