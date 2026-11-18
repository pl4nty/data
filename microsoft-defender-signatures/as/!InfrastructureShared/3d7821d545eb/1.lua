-- Threat: !InfrastructureShared
-- Name: 3d7821d545eb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
