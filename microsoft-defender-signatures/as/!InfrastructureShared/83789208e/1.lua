-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\83789208e\1.luac 

-- params : ...
-- function num : 0
if (((((not (hstrlog[1]).matched or (hstrlog[2]).matched) and not (hstrlog[4]).matched) or (hstrlog[5]).matched) and not (hstrlog[6]).matched) or (mp.getfilesize)() < 750000) and 0 + 1 + 1 >= 1 and ((hstrlog[3]).matched or 0 + 1 + 1 + 1 >= 2) then
  return mp.INFECTED
end
return mp.CLEAN

