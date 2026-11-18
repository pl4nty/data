-- Threat: !InfrastructureShared
-- Name: !#Lua:ZipxDownloaded
-- Type: 13
-- MpAttributes: RPF:AnyFileHasIOAVURL & RPF:TopLevelFile & BM_ZIP_FILE & Lua:ZIPXExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = "ZipXByIOAV"
local l_0_2 = MpCommon.QueryPersistContext(l_0_0, l_0_1)
if not l_0_2 then
  MpCommon.AppendPersistContext(l_0_0, l_0_1, 100)
end
return mp.INFECTED
