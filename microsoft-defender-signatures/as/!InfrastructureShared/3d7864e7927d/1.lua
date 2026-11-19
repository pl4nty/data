-- Threat: !InfrastructureShared
-- Name: 3d7864e7927d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
