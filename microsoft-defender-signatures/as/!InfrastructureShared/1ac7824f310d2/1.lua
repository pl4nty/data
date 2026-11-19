-- Threat: !InfrastructureShared
-- Name: 1ac7824f310d2
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
