-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\437883a14\0x000084ab_luac 

-- params : ...
-- function num : 0
if (not (hstrlog[1]).matched or (mp.getfilesize)() < 310000) and 0 + 1 == 1 then
  return mp.INFECTED
end
return mp.CLEAN

