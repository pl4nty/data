-- Threat: !InfrastructureShared
-- Name: a178eb230773
-- Type: 21

if peattributes.no_security == true and peattributes.isvbnative == true then
  return mp.INFECTED
end
return mp.CLEAN
