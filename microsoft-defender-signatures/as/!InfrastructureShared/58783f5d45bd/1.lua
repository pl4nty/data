-- Threat: !InfrastructureShared
-- Name: 58783f5d45bd
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
