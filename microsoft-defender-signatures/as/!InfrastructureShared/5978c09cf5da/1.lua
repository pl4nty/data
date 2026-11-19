-- Threat: !InfrastructureShared
-- Name: 5978c09cf5da
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
