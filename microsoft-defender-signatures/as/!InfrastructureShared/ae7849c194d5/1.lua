-- Threat: !InfrastructureShared
-- Name: ae7849c194d5
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
