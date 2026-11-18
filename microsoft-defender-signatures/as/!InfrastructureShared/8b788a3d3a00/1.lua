-- Threat: !InfrastructureShared
-- Name: 8b788a3d3a00
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
