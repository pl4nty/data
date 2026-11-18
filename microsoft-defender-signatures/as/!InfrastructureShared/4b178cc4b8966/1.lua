-- Threat: !InfrastructureShared
-- Name: 4b178cc4b8966
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
