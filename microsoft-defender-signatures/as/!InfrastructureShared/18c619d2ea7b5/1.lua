-- Threat: !InfrastructureShared
-- Name: 18c619d2ea7b5
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
