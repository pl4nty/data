-- Threat: !InfrastructureShared
-- Name: 3d786e0f1f66
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
