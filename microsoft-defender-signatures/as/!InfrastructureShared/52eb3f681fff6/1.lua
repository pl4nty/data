local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L3_1 = 20
L4_1 = 20
L5_1 = 100
L6_1 = "ScanOrBruteforce_"
L7_1 = nil
L8_1 = nil
L9_1 = nil
L10_1 = nil
L11_1 = nil
L12_1 = this_sigattrlog
L12_1 = L12_1[24]
L12_1 = L12_1.matched
if L12_1 then
  L12_1 = this_sigattrlog
  L12_1 = L12_1[24]
  L12_1 = L12_1.ppid
  if L12_1 ~= nil then
    L12_1 = this_sigattrlog
    L12_1 = L12_1[24]
    L0_1 = L12_1.ppid
    L12_1 = this_sigattrlog
    L12_1 = L12_1[24]
    L1_1 = L12_1.utf8p2
    L2_1 = "SSH"
  end
end
L12_1 = this_sigattrlog
L12_1 = L12_1[25]
L12_1 = L12_1.matched
if L12_1 then
  L12_1 = this_sigattrlog
  L12_1 = L12_1[25]
  L12_1 = L12_1.ppid
  if L12_1 ~= nil then
    L12_1 = this_sigattrlog
    L12_1 = L12_1[25]
    L0_1 = L12_1.ppid
    L12_1 = this_sigattrlog
    L12_1 = L12_1[25]
    L1_1 = L12_1.utf8p2
    L2_1 = "Telnet"
  end
end
L12_1 = this_sigattrlog
L12_1 = L12_1[26]
L12_1 = L12_1.matched
if L12_1 then
  L12_1 = this_sigattrlog
  L12_1 = L12_1[26]
  L12_1 = L12_1.ppid
  if L12_1 ~= nil then
    L12_1 = this_sigattrlog
    L12_1 = L12_1[26]
    L0_1 = L12_1.ppid
    L12_1 = this_sigattrlog
    L12_1 = L12_1[26]
    L1_1 = L12_1.utf8p2
    L2_1 = "FTP"
  end
end
L12_1 = this_sigattrlog
L12_1 = L12_1[27]
L12_1 = L12_1.matched
if L12_1 then
  L12_1 = this_sigattrlog
  L12_1 = L12_1[27]
  L12_1 = L12_1.ppid
  if L12_1 ~= nil then
    L12_1 = this_sigattrlog
    L12_1 = L12_1[27]
    L0_1 = L12_1.ppid
    L12_1 = this_sigattrlog
    L12_1 = L12_1[27]
    L1_1 = L12_1.utf8p2
    L2_1 = "SMB"
  end
end
L12_1 = this_sigattrlog
L12_1 = L12_1[28]
L12_1 = L12_1.matched
if L12_1 then
  L12_1 = this_sigattrlog
  L12_1 = L12_1[28]
  L12_1 = L12_1.ppid
  if L12_1 ~= nil then
    L12_1 = this_sigattrlog
    L12_1 = L12_1[28]
    L0_1 = L12_1.ppid
    L12_1 = this_sigattrlog
    L12_1 = L12_1[28]
    L1_1 = L12_1.utf8p2
    L2_1 = "LDAP"
  end
end
L12_1 = this_sigattrlog
L12_1 = L12_1[29]
L12_1 = L12_1.matched
if L12_1 then
  L12_1 = this_sigattrlog
  L12_1 = L12_1[29]
  L12_1 = L12_1.ppid
  if L12_1 ~= nil then
    L12_1 = this_sigattrlog
    L12_1 = L12_1[29]
    L0_1 = L12_1.ppid
    L12_1 = this_sigattrlog
    L12_1 = L12_1[29]
    L1_1 = L12_1.utf8p2
    L2_1 = "Kerberos"
  end
end
L12_1 = this_sigattrlog
L12_1 = L12_1[30]
L12_1 = L12_1.matched
if L12_1 then
  L12_1 = this_sigattrlog
  L12_1 = L12_1[30]
  L12_1 = L12_1.ppid
  if L12_1 ~= nil then
    L12_1 = this_sigattrlog
    L12_1 = L12_1[30]
    L0_1 = L12_1.ppid
    L12_1 = this_sigattrlog
    L12_1 = L12_1[30]
    L1_1 = L12_1.utf8p2
    L2_1 = "RDP"
  end
end
if L2_1 == nil or L0_1 == nil or L1_1 == nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.match
L13_1 = L1_1
L14_1 = "DestIp=([^;]*);"
L12_1 = L12_1(L13_1, L14_1)
L8_1 = L12_1
if L8_1 == nil or L8_1 == "" then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = L6_1
L13_1 = L2_1
L7_1 = L12_1 .. L13_1
L12_1 = pcall
L13_1 = MpCommon
L13_1 = L13_1.RollingQueueCreate
L14_1 = L7_1
L15_1 = L5_1
L16_1 = L3_1
L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
L10_1 = L13_1
L9_1 = L12_1
if not L9_1 then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = pcall
L13_1 = MpCommon
L13_1 = L13_1.RollingQueueAppend
L14_1 = L7_1
L15_1 = L8_1
L16_1 = ""
L17_1 = L3_1
L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1, L16_1, L17_1)
L10_1 = L13_1
L9_1 = L12_1
if not L9_1 then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = pcall
L13_1 = MpCommon
L13_1 = L13_1.RollingQueueCount
L14_1 = L7_1
L12_1, L13_1 = L12_1(L13_1, L14_1)
L10_1 = L13_1
L9_1 = L12_1
if not L9_1 then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L11_1 = L10_1
if L4_1 < L11_1 then
  L12_1 = TrackPidAndTechniqueBM
  L13_1 = L0_1
  L14_1 = "T1110"
  L15_1 = "CredentialAccess"
  L12_1(L13_1, L14_1, L15_1)
  L12_1 = mp
  L12_1 = L12_1.INFECTED
  return L12_1
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
