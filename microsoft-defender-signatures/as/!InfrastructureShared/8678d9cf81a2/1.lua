-- Threat: !InfrastructureShared
-- Name: 8678d9cf81a2
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
