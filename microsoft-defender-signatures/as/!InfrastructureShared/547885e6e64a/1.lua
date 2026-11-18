-- Threat: !InfrastructureShared
-- Name: 547885e6e64a
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
