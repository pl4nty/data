-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2678d6b3f\1.luac 

-- params : ...
-- function num : 0
if ((hstrlog[1]).VA < 16384 or (hstrlog[2]).matched) and (mp.getfilesize)() > 1024 and (mp.getfilesize)() < 10000000 then
  return mp.INFECTED
end
return mp.CLEAN

