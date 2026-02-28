local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L0_1 = L2_1.ppid
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L1_1 = L2_1.image_path
end
if L0_1 ~= nil and L1_1 ~= nil then
  L2_1 = TrackPidAndTechniqueBM
  L3_1 = L0_1
  L4_1 = "T1110.001"
  L5_1 = "CredentialAccess_FtpBruteForceOutgoing"
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = L2_1.image_path
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1.image_path
    L5_1 = "/usr/sbin/sshd"
    L6_1 = -14
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L3_1 = "CredentialAccess_FtpBruteForceOutgoing"
      L4_1 = L2_1.image_path
      if L4_1 == L1_1 then
        L4_1 = mp
        L4_1 = L4_1.GetParentProcInfo
        L5_1 = L2_1.ppid
        L4_1 = L4_1(L5_1)
        if L4_1 ~= nil then
          L5_1 = TrackPidAndTechniqueBM
          L6_1 = L4_1.ppid
          L7_1 = "T1110.001"
          L8_1 = L3_1
          L5_1(L6_1, L7_1, L8_1)
        end
      end
      L4_1 = TrackPidAndTechniqueBM
      L5_1 = L2_1.ppid
      L6_1 = "T1110.001"
      L7_1 = L3_1
      L4_1(L5_1, L6_1, L7_1)
    end
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
