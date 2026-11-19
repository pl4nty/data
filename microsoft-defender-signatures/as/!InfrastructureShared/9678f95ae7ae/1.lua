-- Threat: !InfrastructureShared
-- Name: 9678f95ae7ae
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
