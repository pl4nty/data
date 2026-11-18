-- Threat: !InfrastructureShared
-- Name: ae7827958055
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
