-- Threat: !InfrastructureShared
-- Name: 5b78515f429c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
