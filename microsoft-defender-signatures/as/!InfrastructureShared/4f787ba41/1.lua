-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4f787ba41\1.luac 

-- params : ...
-- function num : 0
if ((hstrlog[4]).matched or (hstrlog[5]).matched) and (hstrlog[1]).VA < (hstrlog[2]).VA and (hstrlog[2]).VA < (hstrlog[3]).VA then
  return mp.INFECTED
end
return mp.CLEAN

