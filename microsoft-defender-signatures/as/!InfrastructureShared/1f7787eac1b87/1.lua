-- Threat: !InfrastructureShared
-- Name: 1f7787eac1b87
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
