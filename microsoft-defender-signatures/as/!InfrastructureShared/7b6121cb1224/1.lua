-- Threat: !InfrastructureShared
-- Name: 7b6121cb1224
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
