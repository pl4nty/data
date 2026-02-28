local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = "ftp"
L3_1 = "sftp-server"
L4_1 = "vsftpd"
L5_1 = "netkit-fp"
L6_1 = "sshd"
L7_1 = "smbclient"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L2_1 = {}
L3_1 = "wget"
L4_1 = "curl"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = ipairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  if L0_1 == L7_1 then
    L8_1 = mp
    L8_1 = L8_1.set_mpattribute
    L9_1 = "MpRemoteTransfer"
    L8_1(L9_1)
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  if L0_1 == L7_1 then
    L8_1 = mp
    L8_1 = L8_1.set_mpattribute
    L9_1 = "MpRemoteDownload"
    L8_1(L9_1)
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
