-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a8788ed98\1.luac 

-- params : ...
-- function num : 0
if (hstrlog[1]).matched or (((hstrlog[2]).matched and (hstrlog[3]).matched) or not (hstrlog[4]).matched or (hstrlog[5]).matched) then
  return mp.INFECTED
end
return mp.CLEAN

