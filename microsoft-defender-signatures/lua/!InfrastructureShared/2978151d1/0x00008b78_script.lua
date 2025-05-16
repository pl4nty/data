-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2978151d1\0x00008b78_luac 

-- params : ...
-- function num : 0
if ((hstrlog[1]).matched and (hstrlog[3]).matched) or (hstrlog[2]).matched and (hstrlog[4]).matched then
  return mp.INFECTED
end
return mp.CLEAN

