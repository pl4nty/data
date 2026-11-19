-- Threat: !InfrastructureShared
-- Name: fb78362a0fe6
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
