-- Threat: !InfrastructureShared
-- Name: 997849c3ccc8
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
