-- Threat: !InfrastructureShared
-- Name: 66781dbf7f5d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
