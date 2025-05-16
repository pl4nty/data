-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2c787b68d\0x00007a98_luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() < 5000000 and (hstrlog[1]).matched then
  return mp.INFECTED
end
return mp.CLEAN

