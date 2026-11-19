-- Threat: !InfrastructureShared
-- Name: d461aa6c90e4
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
