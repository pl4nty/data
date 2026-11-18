-- Threat: !InfrastructureShared
-- Name: 3a7863732adb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
