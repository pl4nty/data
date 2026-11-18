-- Threat: !InfrastructureShared
-- Name: 7878ae27f0b7
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
