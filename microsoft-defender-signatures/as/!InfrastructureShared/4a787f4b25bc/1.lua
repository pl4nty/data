-- Threat: !InfrastructureShared
-- Name: 4a787f4b25bc
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
