-- Threat: !InfrastructureShared
-- Name: 11961828b6b31
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
