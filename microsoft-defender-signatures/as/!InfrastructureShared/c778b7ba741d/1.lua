-- Threat: !InfrastructureShared
-- Name: c778b7ba741d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
