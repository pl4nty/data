-- Threat: !InfrastructureShared
-- Name: 7778af7947b4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
