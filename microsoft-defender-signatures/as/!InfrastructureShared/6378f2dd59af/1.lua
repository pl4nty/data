-- Threat: !InfrastructureShared
-- Name: 6378f2dd59af
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
