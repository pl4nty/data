-- Threat: !InfrastructureShared
-- Name: 6378a668fc58
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
