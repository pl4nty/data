-- Threat: !InfrastructureShared
-- Name: dd78c7f75015
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
