-- Threat: !InfrastructureShared
-- Name: 7f78b0e0ec62
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
