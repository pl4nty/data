-- Threat: !InfrastructureShared
-- Name: 8a61ac4ae218
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
