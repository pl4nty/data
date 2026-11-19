-- Threat: !InfrastructureShared
-- Name: 927881583d76
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
