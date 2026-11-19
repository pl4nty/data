-- Threat: !InfrastructureShared
-- Name: 737824ce7d42
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
