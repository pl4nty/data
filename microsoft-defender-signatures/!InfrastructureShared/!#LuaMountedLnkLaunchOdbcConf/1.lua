-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaMountedLnkLaunchOdbcConf\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 > 2 or l_0_1 == nil then
  return mp.CLEAN
end
if (MpCommon.GetMountedFileBackingFilePath)(l_0_0 .. "\\" .. l_0_1) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

