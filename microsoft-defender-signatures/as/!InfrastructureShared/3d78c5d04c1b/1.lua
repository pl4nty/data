-- Threat: !InfrastructureShared
-- Name: 3d78c5d04c1b
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
