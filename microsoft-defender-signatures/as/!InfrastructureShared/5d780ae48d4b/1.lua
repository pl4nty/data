-- Threat: !InfrastructureShared
-- Name: 5d780ae48d4b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
