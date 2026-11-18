-- Threat: !InfrastructureShared
-- Name: 8a7820105196
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
