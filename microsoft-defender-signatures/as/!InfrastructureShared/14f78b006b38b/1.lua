-- Threat: !InfrastructureShared
-- Name: 14f78b006b38b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
