-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\82f3_295.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 5120 then
  return mp.CLEAN
end
if (string.lower)((mp.getfilename)(mp.FILEPATH_QUERY_FNAME)) == "cnqmutil.dll" then
  return mp.INFECTED
end
return mp.CLEAN

