-- Threat: !InfrastructureShared
-- Name: 2778f8dd0f3d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
