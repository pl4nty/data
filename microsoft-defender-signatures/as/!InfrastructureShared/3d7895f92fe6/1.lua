-- Threat: !InfrastructureShared
-- Name: 3d7895f92fe6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
