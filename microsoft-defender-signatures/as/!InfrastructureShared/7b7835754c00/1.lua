-- Threat: !InfrastructureShared
-- Name: 7b7835754c00
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
