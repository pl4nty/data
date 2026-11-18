-- Threat: !InfrastructureShared
-- Name: !#ALF:LuaWZipVBSWebMailAndMotw
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & RPF:AnyFileHasIOAVURL & Lua:SingleSuspiciousExtensionInZip & Lua:ZipEncrypted & SLF:VbsSingleFileInsideArchive.B

local l_0_0 = string.lower(mp.IOAVGetDownloadUrl())
if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true and mp.GetMOTWZone() >= 3 and l_0_0 ~= nil and (string.find(l_0_0, "docs.googleusercontent.com/docs", 1, true) or string.find(l_0_0, "drive.google.com", 1, true)) then
  local l_0_1 = mp.getfilesize()
  if l_0_1 <= 2097152 then
    return mp.INFECTED
  end
end
return mp.CLEAN
