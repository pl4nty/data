-- Threat: !InfrastructureShared
-- Name: 8778a909f88d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
