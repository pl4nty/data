-- Threat: !InfrastructureShared
-- Name: 63611ed1a8ec
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
