-- Threat: !InfrastructureShared
-- Name: f3788d97222c
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
