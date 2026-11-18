-- Threat: !InfrastructureShared
-- Name: 3d787935114a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
