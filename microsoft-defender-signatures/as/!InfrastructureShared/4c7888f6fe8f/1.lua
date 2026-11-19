-- Threat: !InfrastructureShared
-- Name: 4c7888f6fe8f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
