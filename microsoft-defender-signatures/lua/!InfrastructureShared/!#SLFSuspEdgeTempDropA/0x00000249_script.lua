-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFSuspEdgeTempDropA\0x00000249_luac 

-- params : ...
-- function num : 0
if (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE)) == "tmp504e.tmp" and (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)) == "msedge.exe" then
  return mp.INFECTED
end
return mp.CLEAN

