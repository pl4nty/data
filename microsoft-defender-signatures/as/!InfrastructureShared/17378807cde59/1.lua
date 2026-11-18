-- Threat: !InfrastructureShared
-- Name: 17378807cde59
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
