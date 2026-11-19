-- Threat: !InfrastructureShared
-- Name: 5f78f12a8f50
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
