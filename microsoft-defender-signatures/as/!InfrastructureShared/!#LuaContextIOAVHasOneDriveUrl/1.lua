-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/IOAVHasOneDriveUrl
-- Type: 13
-- MpAttributes: RPF:AnyFileHasIOAVURL & RPF:TopLevelFile & (BM_ZIP_FILE | BM_RAR_FILE | Lua:ZipEncrypted | Lua:RarHasEncryptedFile | Lua:RarHasEncryptionHeader)

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0:find("onedrive.live.com/", 1, true) or l_0_0:find("sharepoint.com/", 1, true) then
  local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  local l_0_2 = "IOAVHasOneDriveUrl"
  local l_0_3 = MpCommon.QueryPersistContext(l_0_1, l_0_2)
  if not l_0_3 then
    MpCommon.AppendPersistContext(l_0_1, l_0_2, 100)
  end
  return mp.INFECTED
end
return mp.CLEAN
