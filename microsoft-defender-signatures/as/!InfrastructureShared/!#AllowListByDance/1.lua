-- Threat: !InfrastructureShared
-- Name: !#AllowList:ByDance
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & LUA:FileSizeGT256M.A & AGGR:SingleFileInArchive & Nscript:Type_vbs

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0 == "app-64.7z" or l_0_0 == "app-32.7z" then
  return mp.INFECTED
end
return mp.CLEAN
