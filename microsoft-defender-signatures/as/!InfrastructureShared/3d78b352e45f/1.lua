-- Threat: !InfrastructureShared
-- Name: 3d78b352e45f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
