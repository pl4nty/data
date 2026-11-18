-- Threat: !InfrastructureShared
-- Name: 7a6147e6aaba
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
