-- Threat: !InfrastructureShared
-- Name: 91615c2597d7
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
