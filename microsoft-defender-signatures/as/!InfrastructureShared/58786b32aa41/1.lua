-- Threat: !InfrastructureShared
-- Name: 58786b32aa41
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
