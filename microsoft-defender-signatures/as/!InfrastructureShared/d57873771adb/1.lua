-- Threat: !InfrastructureShared
-- Name: d57873771adb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
