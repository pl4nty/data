-- Threat: !InfrastructureShared
-- Name: 34789708e6f7
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
