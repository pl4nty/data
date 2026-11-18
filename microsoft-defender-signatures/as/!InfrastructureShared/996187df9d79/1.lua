-- Threat: !InfrastructureShared
-- Name: 996187df9d79
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
