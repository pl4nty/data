-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5578a4034\1.luac 

-- params : ...
-- function num : 0
if ((((((hstrlog[1]).matched and not (hstrlog[1]).matched) or (hstrlog[2]).matched) and not (hstrlog[3]).matched) or (mp.getfilesize)() < 300000) and 0 + 1 >= 1) or 0 + 1 + 1 + 1 >= 2 then
  return mp.INFECTED
end
return mp.CLEAN

