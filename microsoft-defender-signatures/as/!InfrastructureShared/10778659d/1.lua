-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\10778659d\1.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT == 10 and (hstrlog[3]).matched and (hstrlog[8]).matched then
  return mp.CLEAN
end
if mp.HSTR_WEIGHT == 9 then
  return mp.SUSPICIOUS
end
return mp.INFECTED

