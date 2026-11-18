-- Threat: !InfrastructureShared
-- Name: 7d7851442f89
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
