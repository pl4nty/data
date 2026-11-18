-- Threat: !InfrastructureShared
-- Name: 60784d2d39d0
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
