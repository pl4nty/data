-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6a75_226.luac 

-- params : ...
-- function num : 0
if (hstrlog[11]).matched or (hstrlog[12]).matched or (hstrlog[13]).matched then
  return mp.INFECTED
end
return mp.CLEAN

