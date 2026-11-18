-- Threat: !InfrastructureShared
-- Name: 4e78c4a48b4c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
