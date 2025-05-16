-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\aa782833a\0x000095be_luac 

-- params : ...
-- function num : 0
if (((hstrlog[1]).matched and not (hstrlog[2]).matched) or (mp.getfilesize)() < 50000) and 0 + 1 + 1 >= 1 then
  return mp.INFECTED
end
return mp.CLEAN

