-- Threat: !InfrastructureShared
-- Name: 4d7803adb51d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
