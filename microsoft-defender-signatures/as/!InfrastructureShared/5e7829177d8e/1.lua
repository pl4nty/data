-- Threat: !InfrastructureShared
-- Name: 5e7829177d8e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
