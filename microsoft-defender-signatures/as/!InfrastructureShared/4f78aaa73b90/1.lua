-- Threat: !InfrastructureShared
-- Name: 4f78aaa73b90
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
