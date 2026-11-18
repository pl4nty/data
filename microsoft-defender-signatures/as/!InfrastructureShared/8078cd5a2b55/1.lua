-- Threat: !InfrastructureShared
-- Name: 8078cd5a2b55
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
