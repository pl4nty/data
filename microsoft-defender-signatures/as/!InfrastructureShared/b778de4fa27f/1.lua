-- Threat: !InfrastructureShared
-- Name: b778de4fa27f
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
