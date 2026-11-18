-- Threat: !InfrastructureShared
-- Name: 3d7889cbf94a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
