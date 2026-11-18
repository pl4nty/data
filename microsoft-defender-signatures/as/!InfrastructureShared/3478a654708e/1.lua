-- Threat: !InfrastructureShared
-- Name: 3478a654708e
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
