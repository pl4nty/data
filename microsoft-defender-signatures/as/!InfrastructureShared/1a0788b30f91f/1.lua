-- Threat: !InfrastructureShared
-- Name: 1a0788b30f91f
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
