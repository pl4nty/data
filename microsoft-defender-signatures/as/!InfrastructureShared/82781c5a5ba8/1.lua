-- Threat: !InfrastructureShared
-- Name: 82781c5a5ba8
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
