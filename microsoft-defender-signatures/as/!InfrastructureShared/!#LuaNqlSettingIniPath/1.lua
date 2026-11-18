-- Threat: !InfrastructureShared
-- Name: !#Lua:NqlSettingIniPath
-- Type: 13

local l_0_0 = mp.getfilesize()
if 2000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = "C:\\Windows\\System32\\setting.ini"
local l_0_2 = mp.getfilename()
if l_0_2 == l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
