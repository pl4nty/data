-- Threat: !InfrastructureShared
-- Name: 8061f4fc6064
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
