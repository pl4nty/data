-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuamaliciousASAR\0x000017fc_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 20971520 or l_0_0 > 104857600 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = (mp.readfile)(l_0_0 - 16384, 8192)
;
(mp.readprotection)(true)
if l_0_1 ~= nil then
  l_0_1 = tostring(l_0_1)
  if (string.find)(l_0_1, "js-confuser", 1, true) ~= nil or (string.find)(l_0_1, "javascript-obfuscator", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN

