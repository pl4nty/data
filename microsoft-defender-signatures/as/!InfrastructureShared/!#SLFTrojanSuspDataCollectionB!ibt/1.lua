-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanSuspDataCollectionB!ibt\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("Lua:LastFolder1!users") and (mp.get_mpattribute)("Lua:LastFolderCount!2") then
  local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_0 == nil or #l_0_0 >= 8 then
    return mp.CLEAN
  end
  local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if #split(l_0_1, "\\") >= 7 then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

