-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspArchiveFile.S01
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (AGGR:SingleArchiveFileInArchive | Lua:SingleFileJSInZip | LuaZipWithSingleJS)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_1 and string.lower(l_0_1) == "firefox.exe" then
    mp.set_mpattribute("MpDisableCaching")
    local l_0_2 = mp.getfilesize()
    if l_0_2 < 1000 then
      mp.set_mpattribute("MpForceScanArchives")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
