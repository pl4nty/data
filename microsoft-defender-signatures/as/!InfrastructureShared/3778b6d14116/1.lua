-- Threat: !InfrastructureShared
-- Name: 3778b6d14116
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
