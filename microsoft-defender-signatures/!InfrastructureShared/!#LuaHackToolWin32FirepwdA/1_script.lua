-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaHackToolWin32FirepwdA\1_luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("BRUTE:HackTool:Win32/Firepwd") or (mp.get_mpattribute)("KCRC:ackTool:Win32/Firepwd") then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:FnameAttr!foxadminpro.exe") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
local l_0_1 = 12288
;
(mp.readprotection)(false)
local l_0_2 = tostring((mp.readfile)(l_0_0 - l_0_1, l_0_1))
if l_0_2 == nil or l_0_2:len() < 8192 then
  return mp.CLEAN
end
if (string.find)(l_0_2, "firepwd", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

