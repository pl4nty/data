-- Threat: !InfrastructureShared
-- Name: 9f78a36f3d32
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
