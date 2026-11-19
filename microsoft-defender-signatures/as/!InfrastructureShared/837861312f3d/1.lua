-- Threat: !InfrastructureShared
-- Name: 837861312f3d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
