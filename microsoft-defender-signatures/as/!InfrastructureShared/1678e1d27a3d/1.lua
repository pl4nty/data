-- Threat: !InfrastructureShared
-- Name: 1678e1d27a3d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
