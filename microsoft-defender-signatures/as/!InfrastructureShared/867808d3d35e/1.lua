-- Threat: !InfrastructureShared
-- Name: 867808d3d35e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
