-- Threat: !InfrastructureShared
-- Name: 3678b062a13f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
