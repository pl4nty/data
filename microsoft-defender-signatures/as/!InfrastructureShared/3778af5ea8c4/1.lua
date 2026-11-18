-- Threat: !InfrastructureShared
-- Name: 3778af5ea8c4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
