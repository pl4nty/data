-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaLNK_ValidHeaderSize\0x0000141a_luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 76 then
  return mp.INFECTED
end
return mp.CLEAN

