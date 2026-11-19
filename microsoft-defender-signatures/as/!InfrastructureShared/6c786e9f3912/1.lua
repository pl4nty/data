-- Threat: !InfrastructureShared
-- Name: 6c786e9f3912
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
