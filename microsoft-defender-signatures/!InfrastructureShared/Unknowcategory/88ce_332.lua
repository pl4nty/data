-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\88ce_332.luac 

-- params : ...
-- function num : 0
if not (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE)) then
  return mp.CLEAN
end
if (mp.get_mpattribute)("HSTR:AADInternalWin32Ntv") then
  return mp.CLEAN
end
return mp.INFECTED

