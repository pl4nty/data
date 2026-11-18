-- Threat: !InfrastructureShared
-- Name: bb786cb6bc77
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
