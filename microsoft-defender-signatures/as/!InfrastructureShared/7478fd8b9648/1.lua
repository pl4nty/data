-- Threat: !InfrastructureShared
-- Name: 7478fd8b9648
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
