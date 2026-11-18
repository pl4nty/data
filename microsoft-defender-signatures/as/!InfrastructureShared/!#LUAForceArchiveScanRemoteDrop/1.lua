-- Threat: !InfrastructureShared
-- Name: !#LUA:ForceArchiveScanRemoteDrop
-- Type: 12
-- MpAttributes: MpOnModifiedCloseRtpScan & (BM_BZIP2_FILE | BM_ZIP_FILE | BM_7Z_FILE | BM_GZIP_FILE | BM_XAR_ARCHIVE_FILE | BM_ZLIB_FILE | BM_TAR_FILE) & RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if 1048576 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {
  "ftp",
  "sftp-server",
  "vsftpd",
  "netkit-fp",
  "sshd",
  "smbclient",
  "wget",
  "curl"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if l_0_1 == l_0_4 then
    mp.set_mpattribute("MpForceScanArchives")
    return mp.INFECTED
  end
end
return mp.CLEAN
