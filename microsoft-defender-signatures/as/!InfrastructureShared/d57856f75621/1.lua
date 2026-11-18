-- Threat: !InfrastructureShared
-- Name: d57856f75621
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
