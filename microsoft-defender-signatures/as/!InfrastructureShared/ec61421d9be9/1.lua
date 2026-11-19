-- Threat: !InfrastructureShared
-- Name: ec61421d9be9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
