-- Threat: !InfrastructureShared
-- Name: ac788be3d645
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
