-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9e780c82b\1.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT == 20 and (hstrlog[1]).matched and (hstrlog[4]).matched then
  return mp.CLEAN
end
if mp.HSTR_WEIGHT == 11 then
  return mp.SUSPICIOUS
end
return mp.INFECTED

