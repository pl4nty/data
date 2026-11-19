-- Threat: !InfrastructureShared
-- Name: 4878a939d33c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
