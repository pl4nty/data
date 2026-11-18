-- Threat: !InfrastructureShared
-- Name: 58783f007ff0
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
