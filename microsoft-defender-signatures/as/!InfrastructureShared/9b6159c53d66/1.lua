-- Threat: !InfrastructureShared
-- Name: 9b6159c53d66
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
