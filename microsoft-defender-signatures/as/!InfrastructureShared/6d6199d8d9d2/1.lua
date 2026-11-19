-- Threat: !InfrastructureShared
-- Name: 6d6199d8d9d2
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
