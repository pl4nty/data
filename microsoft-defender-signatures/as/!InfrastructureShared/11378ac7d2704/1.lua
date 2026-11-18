-- Threat: !InfrastructureShared
-- Name: 11378ac7d2704
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
