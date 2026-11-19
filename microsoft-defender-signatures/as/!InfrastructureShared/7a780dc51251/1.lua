-- Threat: !InfrastructureShared
-- Name: 7a780dc51251
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
