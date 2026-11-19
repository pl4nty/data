-- Threat: !InfrastructureShared
-- Name: a87820c2be3d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
