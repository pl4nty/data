-- Threat: !InfrastructureShared
-- Name: 3778bd8c91c5
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
