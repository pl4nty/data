-- Threat: !InfrastructureShared
-- Name: f778e43a240c
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
