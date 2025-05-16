-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x0000810e_luac 

-- params : ...
-- function num : 0
if (string.lower)((mp.getfilename)(mp.FILEPATH_QUERY_FNAME)) ~= "sbiedll.dll" then
  return mp.CLEAN
end
return mp.INFECTED

