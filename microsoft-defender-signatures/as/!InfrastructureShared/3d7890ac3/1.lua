-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3d7890ac3\1.luac 

-- params : ...
-- function num : 0
if (not (hstrlog[1]).matched or (mp.getfilesize)() < 600000) and 0 + 1 >= 1 then
  return mp.INFECTED
end
return mp.CLEAN

