-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\719f_255.luac 

-- params : ...
-- function num : 0
if (hstrlog[4]).matched or (hstrlog[5]).matched or (hstrlog[6]).matched or (hstrlog[7]).matched then
  return mp.INFECTED
end
return mp.CLEAN

