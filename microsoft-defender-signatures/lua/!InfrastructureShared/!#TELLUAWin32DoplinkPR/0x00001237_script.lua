-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELLUAWin32DoplinkPR\0x00001237_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
local l_0_1 = (mp.getfilesize)()
if (l_0_0 == nil or (string.len)(l_0_0) <= 5) and l_0_1 < 65536 and l_0_1 > 86016 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_2 = tostring((mp.readfile)(128, 50))
l_0_2 = (string.lower)(l_0_2)
if (string.find)(l_0_2, "grunt_app_silent_launch_param", 1, true) ~= nil and (string.find)(l_0_0, "start.bin", 1, true) ~= nil then
  (mp.set_mpattribute)("LUA:Win32/Doplink.PR")
  return mp.INFECTED
end
return mp.CLEAN

