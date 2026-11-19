-- Threat: !InfrastructureShared
-- Name: 8078284978de
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
