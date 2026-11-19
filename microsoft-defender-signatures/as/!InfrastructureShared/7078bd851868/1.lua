-- Threat: !InfrastructureShared
-- Name: 7078bd851868
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
