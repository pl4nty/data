-- Threat: !InfrastructureShared
-- Name: 15d78d0adb2f9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
