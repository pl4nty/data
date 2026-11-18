-- Threat: !InfrastructureShared
-- Name: 317802dcca9d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
