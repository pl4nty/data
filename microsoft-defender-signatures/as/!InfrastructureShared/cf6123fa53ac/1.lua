-- Threat: !InfrastructureShared
-- Name: cf6123fa53ac
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
