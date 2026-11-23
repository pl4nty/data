-- Threat: !InfrastructureShared
-- Name: 66781161e318
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
