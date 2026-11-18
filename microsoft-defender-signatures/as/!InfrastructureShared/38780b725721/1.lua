-- Threat: !InfrastructureShared
-- Name: 38780b725721
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
