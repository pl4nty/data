-- Threat: !InfrastructureShared
-- Name: 5361212a7daf
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
