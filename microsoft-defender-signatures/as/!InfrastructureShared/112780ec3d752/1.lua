-- Threat: !InfrastructureShared
-- Name: 112780ec3d752
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
