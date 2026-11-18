-- Threat: !InfrastructureShared
-- Name: 1b778281b965c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
