-- Threat: !InfrastructureShared
-- Name: d978adb4adbb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
