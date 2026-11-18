-- Threat: !InfrastructureShared
-- Name: 6e78adb9bb70
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
