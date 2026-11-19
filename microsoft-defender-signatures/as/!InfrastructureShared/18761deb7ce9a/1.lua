-- Threat: !InfrastructureShared
-- Name: 18761deb7ce9a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
