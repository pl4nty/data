-- Threat: !InfrastructureShared
-- Name: 8d61000e0a2e
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
