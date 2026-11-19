-- Threat: !InfrastructureShared
-- Name: dc784615a8af
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
