-- Threat: !InfrastructureShared
-- Name: b540fc75d0fe
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
