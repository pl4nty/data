-- Threat: !InfrastructureShared
-- Name: 15b780ac2c3d0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
