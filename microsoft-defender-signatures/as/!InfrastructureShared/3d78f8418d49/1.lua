-- Threat: !InfrastructureShared
-- Name: 3d78f8418d49
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
