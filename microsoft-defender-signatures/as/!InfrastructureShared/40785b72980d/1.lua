-- Threat: !InfrastructureShared
-- Name: 40785b72980d
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
