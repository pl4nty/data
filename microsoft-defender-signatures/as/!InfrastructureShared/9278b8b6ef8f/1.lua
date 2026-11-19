-- Threat: !InfrastructureShared
-- Name: 9278b8b6ef8f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
