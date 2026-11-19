-- Threat: !InfrastructureShared
-- Name: 3478ea7fdd6b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
