-- Threat: !InfrastructureShared
-- Name: 6e7889bf5a53
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
