-- Threat: !InfrastructureShared
-- Name: 2a7827bb6773
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
