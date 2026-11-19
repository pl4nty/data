-- Threat: !InfrastructureShared
-- Name: 6c615e5d6fb9
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
