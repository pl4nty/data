-- Threat: !InfrastructureShared
-- Name: 5b788f54b49d
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
