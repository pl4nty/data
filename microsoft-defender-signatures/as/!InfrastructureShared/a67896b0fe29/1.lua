-- Threat: !InfrastructureShared
-- Name: a67896b0fe29
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
