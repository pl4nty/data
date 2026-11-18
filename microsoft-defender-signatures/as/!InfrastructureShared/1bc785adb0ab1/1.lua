-- Threat: !InfrastructureShared
-- Name: 1bc785adb0ab1
-- Type: 21

local l_0_0 = mp.getfilesize()
if 720896 <= l_0_0 and l_0_0 <= 917504 and peattributes.ismsil == true and peattributes.isdll == false and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
