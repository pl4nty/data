-- Threat: !InfrastructureShared
-- Name: 5678d9ba8f65
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
