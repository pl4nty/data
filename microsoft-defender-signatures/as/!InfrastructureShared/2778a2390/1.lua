-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2778a2390\1.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() < 100000 and (hstrlog[1]).matched then
  return mp.INFECTED
end
return mp.CLEAN

