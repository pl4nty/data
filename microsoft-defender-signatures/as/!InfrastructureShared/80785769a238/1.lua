-- Threat: !InfrastructureShared
-- Name: 80785769a238
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
