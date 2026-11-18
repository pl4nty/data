-- Threat: !InfrastructureShared
-- Name: !#LUA:SetRemoteMpAttribute
-- Type: 12
-- MpAttributes: MpOnModifiedCloseRtpScan & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  "ftp",
  "sftp-server",
  "vsftpd",
  "netkit-fp",
  "sshd",
  "smbclient"
}
local l_0_2 = {"wget", "curl"}
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if l_0_0 == l_0_4 then
    mp.set_mpattribute("MpRemoteTransfer")
    return mp.INFECTED
  end
end
for l_0_5, l_0_6 in ipairs(l_0_2) do
  if l_0_0 == l_0_6 then
    mp.set_mpattribute("MpRemoteDownload")
    return mp.INFECTED
  end
end
return mp.CLEAN
