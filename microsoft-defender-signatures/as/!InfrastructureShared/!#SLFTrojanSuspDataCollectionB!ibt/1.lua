-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:SuspDataCollection.B!ibt
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & MpOnModifiedCloseRtpScan & MpNewlyCreatedHint & LUA:ZipRar7ZFileLE1M.A & Lua:ZIPExt

if mp.get_mpattribute("Lua:LastFolder1!users") and mp.get_mpattribute("Lua:LastFolderCount!2") then
  local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_0 == nil or 8 <= #l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = split(l_0_1, "\\")
  if 7 <= #l_0_2 then
    return mp.INFECTED
  end
end
return mp.CLEAN
