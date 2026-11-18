-- Threat: !InfrastructureShared
-- Name: 3d780dab2195
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
