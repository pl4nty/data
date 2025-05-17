-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaEncrypted7zFile\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 4096 or l_0_0 > 1073741824 then
  return mp.CLEAN
end
local l_0_1 = (mp.readu_u64)(headerpage, 13)
local l_0_2 = (mp.readu_u64)(headerpage, 21)
if l_0_1 <= 0 or l_0_2 <= 0 then
  return mp.CLEAN
end
if 32 + l_0_1 + l_0_2 <= 4096 then
  return mp.CLEAN
end
if 32 + l_0_1 + l_0_2 >= 1073741824 then
  return mp.CLEAN
end
if l_0_0 < 32 + l_0_1 + l_0_2 then
  (mp.set_mpattribute)("Lua:7zWithBadFileSize")
  return mp.CLEAN
end
l_0_1 = 32 + l_0_1
if l_0_0 < l_0_1 + 2 or l_0_1 <= 0 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_3 = (mp.readfile)(l_0_1, 2)
;
(mp.readprotection)(true)
if l_0_3 == 0 then
  return mp.CLEAN
end
if (string.byte)(l_0_3, 1) ~= 23 or (string.byte)(l_0_3, 2) ~= 6 then
  return mp.CLEAN
end
if l_0_2 > 128 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_4 = (mp.readfile)(l_0_1, l_0_2 - 1)
;
(mp.readprotection)(true)
if l_0_4 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_4, "\a\v\001\000\002$\006\241\a\001", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

