-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9b780ee0d\0x00007a9f_luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() < 50000 and (hstrlog[1]).matched then
  return mp.INFECTED
end
return mp.CLEAN

