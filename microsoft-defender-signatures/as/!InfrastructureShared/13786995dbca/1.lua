-- Threat: !InfrastructureShared
-- Name: 13786995dbca
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
