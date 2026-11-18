-- Threat: !InfrastructureShared
-- Name: 947893747b3d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
