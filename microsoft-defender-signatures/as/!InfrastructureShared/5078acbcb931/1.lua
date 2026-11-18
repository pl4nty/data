-- Threat: !InfrastructureShared
-- Name: 5078acbcb931
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
