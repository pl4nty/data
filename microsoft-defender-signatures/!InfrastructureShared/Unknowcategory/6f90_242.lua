-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6f90_242.luac 

-- params : ...
-- function num : 0
if (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)) == "iexplore.exe" then
  return mp.INFECTED
end
return mp.CLEAN

