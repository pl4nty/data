-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4778f09d6\1.luac 

-- params : ...
-- function num : 0
if (hstrlog[1]).VA == 0 + pehdr.ImageBase + 4 or (hstrlog[2]).VA == 0 + pehdr.ImageBase + 4 then
  return mp.INFECTED
end
return mp.CLEAN

