-- Threat: !InfrastructureShared
-- Name: 84782b290cc6
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
