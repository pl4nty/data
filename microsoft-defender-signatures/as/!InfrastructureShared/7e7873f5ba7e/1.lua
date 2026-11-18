-- Threat: !InfrastructureShared
-- Name: 7e7873f5ba7e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
