-- Threat: !InfrastructureShared
-- Name: !#Lua:IOAVZipxOpenByRAR
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_ZIP_FILE & Lua:ZIPXExt & MpOnOpenOrCloseRtpScan

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 == "rar.exe" then
  local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  local l_0_2 = "ZipXByIOAV"
  local l_0_3 = MpCommon.QueryPersistContext(l_0_1, l_0_2)
  if l_0_3 then
    mp.set_mpattribute("MpDisableCaching")
    return mp.INFECTED
  end
end
return mp.CLEAN
