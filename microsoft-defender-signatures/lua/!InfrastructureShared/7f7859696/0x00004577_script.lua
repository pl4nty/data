-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7f7859696\0x00004577_luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN

