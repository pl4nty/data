-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\50787e446\0x00008b7a_luac 

-- params : ...
-- function num : 0
if (hstrlog[1]).matched and (hstrlog[2]).matched and (hstrlog[3]).matched and (hstrlog[4]).matched then
  return mp.INFECTED
end
return mp.CLEAN

