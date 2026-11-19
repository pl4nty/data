-- Threat: !InfrastructureShared
-- Name: 8a783e3f4027
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
